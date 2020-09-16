nano .ssh/authorized_keys 
apt-get update && apt-get install -y   apt-transport-https ca-certificates curl software-properties-common gnupg2
sudo su
kubeadm init --pod-network-cidr=192.168.0.0/16
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
swapoff -a
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl get pods -o wide --all-namespaces
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl get pods -o wide --all-namespaces
kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
kubectl get pods --all-namespaces
kubectl patch configmap/calico-config -n kube-system --type merge   -p '{"data":{"veth_mtu": "1440"}}'
kubectl patch configmap/calico-config -n kube-system --type merge   -p '{"data":{"veth_mtu": "1430"}}'
kubectl rollout restart daemonset calico-node -n kube-system
kubectl get pods --all-namespaces
ip link show
kubectl get pods --all-namespaces
ifconfig
kubectl get nodes
kubectl get pods -o wide --all-namespaces
kubectl get nodes
kubectl get pods -o wide --all-namespaces
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.16.0/serving-crds.yaml
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.16.0/serving-core.yaml
ls
istioctl install
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.6.5
ls
cd bin
ls
sudo mv istioctl /usr/local/bin
istioctl version
istioctl install
cat << EOF > ./istio-minimal-operator.yaml
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
spec:
  values:
    global:
      proxy:
        autoInject: disabled
      useMCP: false
      # The third-party-jwt is not enabled on all k8s.
      # See: https://istio.io/docs/ops/best-practices/security/#configure-third-party-service-account-tokens
      jwtPolicy: first-party-jwt

  addonComponents:
    pilot:
      enabled: true
    prometheus:
      enabled: false

  components:
    ingressGateways:
      - name: istio-ingressgateway
        enabled: true
      - name: cluster-local-gateway
        enabled: true
        label:
          istio: cluster-local-gateway
          app: cluster-local-gateway
        k8s:
          service:
            type: ClusterIP
            ports:
            - port: 15020
              name: status-port
            - port: 80
              name: http2
            - port: 443
              name: https
EOF

istioctl manifest apply -f istio-minimal-operator.yaml
kubectl get pods -o wide --all-namespaces
kubectl get services --all-namespaces
kubectl get pods -o wide --all-namespaces
kubectl apply --filename https://github.com/knative/net-istio/releases/download/v0.16.0/release.yaml
kubectl --namespace istio-system get service istio-ingressgateway
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.16.0/serving-default-domain.yaml
kubectl get pods --namespace knative-serving
kn service create helloworld-go --image gcr.io/knative-samples/helloworld-go --env TARGET="Go Sample v1"
git clone https://github.com/knative/client.git
cd client/hack/build.sh -f
hack/build.sh -f
cd client/
hack/build.sh -f
sudo apt update
sudo apt install wget
cd
wget https://golang.org/dl/go1.14.4.linux-amd64.tar.gz
ls
sudo tar -C /usr/local -xzf go1.14.4.linux-amd64.tar.gz
go version
/usr/local/go/bin/go version
nano ~/.profile
source ~/.profile
go version
ls
rm go1.14.4.linux-amd64.tar.gz 
ls
kn service create helloworld-go --image gcr.io/knative-samples/helloworld-go --env TARGET="Go Sample v1"
cd client/
cd istio-1.6.5/
ls
cd bin
ls
cd client/
hack/build.sh -f
ls
sudo mv kn /usr/local/bin
ls
kn version
cd
kn service create helloworld-go --image gcr.io/knative-samples/helloworld-go --env TARGET="Go Sample v1"
kn service describe helloworld-go
curl http://helloworld-go.default.example.com
clear
kn service describe helloworld-go
kubectl get pods -o wide --all-namespaces
kubectl get services --all-namespaces
kubectl --namespace istio-system get service istio-ingressgateway
kn service delete helloworld-go
kubectl get services --all-namespaces
kubectl get pods -o wide --all-namespaces
kubectl get services --all-namespaces
kubectl get pods -o wide --all-namespaces
kubectl get services --all-namespaces
kubectl get pods -o wide --all-namespaces
kubectl get services --all-namespaces
kubectl get services --all-namespaces -o wide
kubectl get pods -o wide --all-namespaces
clear
kubectl get pods -o wide --all-namespaces
kubectl get services -o wide --all-namespaces
kn service describe helloworld-go
kubectl --namespace istio-system get service istio-ingressgateway
kubectl describe service -n istio-system istio-ingressgateway
kubectl describe service -n istio-system istio-ingressgateway -o yaml
kubectl describe service -o wide -n istio-system istio-ingressgateway
kubectl describe service -o yaml -n istio-system istio-ingressgateway
kn service create helloworld-go --image gcr.io/knative-samples/helloworld-go --env TARGET="Go Sample v1"
kn service describe helloworld-go
kubectl get services --all-namespaces
kubectl get endpoints --all-namespaces
curl 192.168.254.129:8012
curl http://192.168.254.129:8012
kubectl get pods -o wide --all-namespaces
kubectl get servies -o wide --all-namespaces
kubectl get services -o wide --all-namespaces
kubectl get services
$ export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
ls
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export TCP_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tcp")].nodePort}')
cat INGRESS_PORT
export INGRESS_HOST=127.0.0.1
kubectl get services -o wide --all-namespaces
kubectl delete --filename service.yaml
kn service delete helloworld-go
kubectl get services --all-namespaces
kubectl get pods --all-namesapces
kubectl get pods --all-namespaces
ls
cd istio-1.6.5/
ls
cd bin
ls
rm istio-minimal-operator.yaml 
cd
ls
rm istio-1.6.5/
rm -r istio-1.6.5/
ls
cat << EOF > ./istio-minimal-operator.yaml
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
spec:
  values:
    global:
      proxy:
        autoInject: disabled
      useMCP: false
      # The third-party-jwt is not enabled on all k8s.
      # See: https://istio.io/docs/ops/best-practices/security/#configure-third-party-service-account-tokens
      jwtPolicy: first-party-jwt

  addonComponents:
    pilot:
      enabled: true
    prometheus:
      enabled: false

  components:
    ingressGateways:
      - name: istio-ingressgateway
        enabled: true
      - name: cluster-local-gateway
        enabled: true
        label:
          istio: cluster-local-gateway
          app: cluster-local-gateway
        k8s:
          service:
            type: ClusterIP
            ports:
            - port: 15020
              name: status-port
            - port: 80
              name: http2
            - port: 443
              name: https
EOF

nano istio-minimal-operator.yaml 
istioctl manifest apply -f istio-minimal-operator.yaml
ls
kubectl get services --all-namespaces
kubectl get pods --all-namespaces
kubectl apply -f httpbin.yaml
git pull https://github.com/istio/istio/tree/release-1.6/samples/httpbin
git clone https://github.com/istio/istio/tree/release-1.6/samples/httpbin
ls
cd istio-1.6.5/
ls
cd samples/
ls
cd httpbin/
ls
kubectl apply -f httpbin.yaml
kubectl get pods --all-namespaces
get svc istio-ingressgateway -n istio-system
kubectl get services --all-namespaces
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}'
kubectl get services --all-namespaces
kubectl get pods --all-namespaces
clear
kubectl get pods 
kubectl describe pod httpbin-66cdbdb6c5-ljwhh
httpbin-66cdbdb6c5-ljwhhkubectl label namespace knative-serving istio-injection=enabled
kubectl label namespace knative-serving istio-injection=enabled
cat <<EOF | kubectl apply -f -
apiVersion: "security.istio.io/v1beta1"
kind: "PeerAuthentication"
metadata:
  name: "default"
  namespace: "knative-serving"
spec:
  mtls:
    mode: PERMISSIVE
EOF

kubectl label namespace knative-serving istio-injection=enabled
kubectl label namespace default istio-injection=enabled
kubectl get deployments
kubectl rollout restart deployment httpbin
kubectl get pods
clear
kubectl get pods
kubectl describe pods httpbin-5b9bc895bf-v27hk
kubectl get endpoints
kubectl --namespace istio-system get service istio-ingressgateway
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.16.0/serving-default-domain.yaml
kn service create helloworld-go --image gcr.io/knative-samples/helloworld-go --env TARGET="Go Sample v1"
curl http://helloworld-go.default.example.com
kubectl get endpoints
curl 192.168.254.129:8012
űcurl 192.168.254.153:80
curl 192.168.254.153:80
clear
kubectl get pods
kubectl get pods -o wide --all-namespaces
kubectl get services
curl cluster-local-gateway.istio-system.svc.cluster.local
kubectl get pods --all-namespaces
kn service describe helloworld-go
kn service delete helloworld-go
kubectl get pods --all-namespaces
kubectl get services
kubectl get services --all-namespaces
clear
kubectl get pods -o wide --all-namespaces
kubectl get services
kubectl describe services httpbin
kubectl describe pods httpbin-5b9bc895bf-v27hk
clear
kubectl get services --all-namesapces
kubectl get services --all-namespaces
kubectl get pods --all-namespaces
curl -v http://localhost
kubectl get svc -n istio-system -l app=istio-ingressgateway
kubectl get svc knative-ingressgateway -n istio-system
kubectl get svc $INGRESSGATEWAY --namespace istio-system
cat /etc/kubernetes/apiserver
kn domain list
knctl domain list
clear
kubectl get pods -o wide --all-namespaces
kubectl get services --all-namespaces
kn service delete httpbin
kubectl delete service httpbin
kubectl get pods -o wide --all-namespaces
kubectl get services --all-namespaces
kubectl get deployments --all-namespaces
kubectl delete deployment httpbin
kubectl get pods
istioctl profile list
kubectl get pods
istioctl profile dump default
istioctl profile dump --config-path components.ingressGateways
istioctl profile dump --config-path values.gateways.istio-ingressgateway
kubectl get pods --all-namespaces
kubectl get services
kubectl get services --all-namespaces
kubectl get svc knative-ingressgateway -n istio-system.
kubectl get svc knative-ingressgateway -n istio-system
cat $HOME/.kube/config
clear
kubectl get namespaces
kubectl get services -n istio-system
kubectl get services -n knative-serving
ls
istioctl analyze
get svc istio-ingressgateway -n istio-system
kubectl get svc istio-ingressgateway -n istio-system
ls
cd istio-1.6.5/
ls
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
kubectl get services
kubectl get pods
cd
kubectl get pods
clear
kubectl get pods
kubectl get pods --all-namespaces
clear
kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') -c ratings -- curl productpage:9080/productpage | grep -o "<title>.*</title>"
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
cd istio-1.6.5/
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
cd
kubectl get pods
istioctl analyze
kubectl get svc istio-ingressgateway -n istio-system
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
$
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
kubectl -n istio-system get service istio-ingressgateway
kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}'
export INGRESS_HOST=127.0.0.1
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo $GATEWAY_URL
echo http://$GATEWAY_URL/productpage
curl http://127.0.0.1:32285/productpage
clear
kubectl get services
samples/bookinfo/platform/kube/cleanup.sh
cd istio-1.6.5/
samples/bookinfo/platform/kube/cleanup.sh
kubectl get virtualservices
kubectl get destinationrules
kubectl get gateway
kubectl get pods
kn service create helloworld-go --image gcr.io/knative-samples/helloworld-go --env TARGET="Go Sample v1"
kubectl get ksvc helloworld-go
echo $GATEWAY_URL
ping 127.0.0.1:32285
kubectl get services
echo http://$GATEWAY_URL/helloworld-go
curl http://127.0.0.1:32285/helloworld-go
curl http://127.0.0.1:32285/helloworld-go-yqqjz-1
kubectl edit cm config-domain --namespace knative-serving
kubectl get pods --all-namespaces
kubectl get services
curl http://127.0.0.1:32285
curl http://127.0.0.1:32285/helloworld-go-yqqjz-1-private
curl http://127.0.0.1:32285/helloworld-go
kubectl get gateways --all-namespaces
kubectl get kubectl --namespace istio-system get service istio-ingressgateway
kubectl --namespace istio-system get service istio-ingressgateway
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.16.0/serving-default-domain.yaml
kn service describe helloworld-go
curl -s -I -HHost:helloworld-go.default.example.com "http://$INGRESS_HOST:$INGRESS_PORT/status/200"
curl -s -I -HHost:helloworld-go.default.example.com "http://$INGRESS_HOST:$INGRESS_PORT"
curl -s -I -HHost:default.example.com "http://$INGRESS_HOST:$INGRESS_PORT"
curl -s -I -HHost:helloworld-go.default.example.com "http://$INGRESS_HOST:$INGRESS_PORT"
curl -s -I -HHost:helloworld-go.default.example.com "http://127.0.0.1:32285"
curl -I -HHost:helloworld-go.default.example.com "http://127.0.0.1:32285"
curl -HHost:helloworld-go.default.example.com "http://127.0.0.1:32285"
cd
curl --trace trace.txt -HHost:helloworld-go.default.example.com "http://127.0.0.1:32285"
ls
cat trace.txt
curl --trace-ascii -HHost:helloworld-go.default.example.com "http://127.0.0.1:32285"
ls
rm -HHost:helloworld-go.default.example.com
rm ./-HHost:helloworld-go.default.example.com'

EOF

ls
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
kubectl get pods --all-namespaces
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
kubectl get pods --all-namespaces
kubectl descripe pods helloworld-go-yqqjz-1-deployment-7b75d94665-vfdrj
kubectl describe pods helloworld-go-yqqjz-1-deployment-7b75d94665-vfdrj
kubectl get pods --all-namespaces
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
kubectl get pods --all-namespaces
kubectl describe pods helloworld-go-yqqjz-1-deployment-7b75d94665-xhfcf
ifconfig
clear
kubectl get services
kubectl describe service helloworld-go
kubectl describe kservice helloworld-go
kn service describe helloworld-go
kubectl get pods -o wide --all-namespaces
kubectl get deployments --all-namespaces
kubectl delete --filename https://github.com/knative/serving/releases/download/v0.16.0/serving-default-domain.yaml
kubectl get pods --all-namespaces
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
kubectl get pods --all-namespaces
kubectl describe pods helloworld-go-yqqjz-1-deployment-7b75d94665-56kc9
kubectl get pods --all-namespaces
echo 'this is a node command'
clear
kubectl get pod -o wide
iptables-save > output.txt
sudo iptables-save > output.txt
ls
cat output.txt
clear
kubectl get deployments
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
kubectl get pods
kubectl get pods -o wide
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
ping 192.168.254.170
traceroute 192.168.254.170
tracert 192.168.254.170
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
sudo apt-get traceroute
apt-get
apt-get traceroute
apt-get tracert
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
sudo apt-get install traceroute
sudo apt-get update
clear
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
kubectl get pods
traceroute helloworld-go-yqqjz-1-deployment-7b75d94665-rxwrg
traceroute helloworld-go-yqqjz-1-deployment-7b75d94665-rxwrg
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
kubectl get pods -o wide
traceroute 192.168.254.171
ifconfig
clear
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
kubectl get pods -o wide
ping http://127.0.0.1:32285
ping 
ping http://127.0.0.1:32285
ping 127.0.0.1:32285
ping 127.0.0.1
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285 -I
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285 -v
curl -s -L -D -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285 
curl -s -L -D -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285  -o /dev/null -w '%{url_effective}'
curl -s -L  -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
curl  -L  -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
curl   -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285 -L
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285 -L -D
curl -H "Host: helloworld-go.default.example.com" -D - http://127.0.0.1:32285
curl -H "Host: helloworld-go.default.example.com" -L -D - http://127.0.0.1:32285
curl -H "Host: helloworld-go.default.example.com" -s -L -D - http://127.0.0.1:32285
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
curl -H "Host: helloworld-go.default.example.com" -s -L -D -
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
clear
kubectl get pods 
clear
kubectl get pods --all-namespaces
kubectl get deployments
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
ls
cat trace.txt
clear
kubectl get pods --all-namespaces
clear
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
kubectl get pods
kubectl describe kservice helloworld-go
lls
ls
cd istio-1.6.5/
ls
cd samples
ls
cd helloworld/
ls
nano helloworld.yaml
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
curl -H "Host: helloworld-go.default.example.com" http://152.66.245.140:32285
kubectl get pods
curl -H "Host: helloworld-go.default.example.com" http://127.0.0.1:32285
ls
kubectl get pods
curl -H "Host: helloworld-go.default.example.com" http://152.66.245.140:32285
curl -H "Host: helloworld-go.default.example.com" http://152.66.245.140
ping 152.66.245.140
ping 152.66.245.138
