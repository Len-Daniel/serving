3 fájlt tartalmaz:
ksvc.yaml:		KNative service, amely UDP és TCP üzenetekre tud válaszolni. Induláskor minimum 2 podra van skálázva, nem skálázódik le nullára.
ksvc_noMinScale:	Mint a fenti, de nullára van skálázva.
svc.yaml:		Sima k8s service, amelyben van egy selector a fenti knative servicek által létrehozott podokra.

A felhasznált konténert az alábbi linken lehet letölteni:
https://gitlab.com/n0r1sk/echo
