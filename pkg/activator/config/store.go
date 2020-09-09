/*
Copyright 2019 The Knative Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package config

import (
	"context"
	"net/http"
	"log"

	"knative.dev/pkg/configmap"
	tracingconfig "knative.dev/pkg/tracing/config"
)

type cfgKey struct{}

// Config is a configuration for the activator
type Config struct {
	Tracing *tracingconfig.Config
}

// FromContext obtains a Config injected into the passed context
func FromContext(ctx context.Context) *Config {
	log.Printf("configStore: FromContext")
	return ctx.Value(cfgKey{}).(*Config)
}

func toContext(ctx context.Context, c *Config) context.Context {
	log.Printf("configStore: toContext")
	return context.WithValue(ctx, cfgKey{}, c)
}

// Store loads/unloads our untyped configuration
// +k8s:deepcopy-gen=false
type Store struct {
	*configmap.UntypedStore
}

// NewStore creates a configuration Store
func NewStore(logger configmap.Logger, onAfterStore ...func(name string, value interface{})) *Store {
	log.Printf("configStore: NewStore")
	return &Store{
		UntypedStore: configmap.NewUntypedStore(
			"activator",
			logger,
			configmap.Constructors{
				tracingconfig.ConfigName: tracingconfig.NewTracingConfigFromConfigMap,
			},
			onAfterStore...,
		),
	}
}

// ToContext stores the configuration Store in the passed context
func (s *Store) ToContext(ctx context.Context) context.Context {
	log.Printf("configStore: ToContext")
	return toContext(ctx, s.Load())
}

// Load creates a Config for this store
func (s *Store) Load() *Config {
	log.Printf("configStore: Load")
	return &Config{
		Tracing: s.UntypedLoad(tracingconfig.ConfigName).(*tracingconfig.Config).DeepCopy(),
	}
}

type storeMiddleware struct {
	store *Store
	next  http.Handler
}

// ServeHTTP injects Config in to the context of the http request r
func (mw *storeMiddleware) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	log.Printf("configStore: ServeHTTP")
	ctx := mw.store.ToContext(r.Context())
	mw.next.ServeHTTP(w, r.WithContext(ctx))
}

// HTTPMiddleware is a middleware which stores the current config store in the request context
func (s *Store) HTTPMiddleware(next http.Handler) http.Handler {
	return &storeMiddleware{
		store: s,
		next:  next,
	}
}
