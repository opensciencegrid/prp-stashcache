pushconfig:
	-kubectl delete configmap stashcache -n osg  # delete if already exists, ignore errors
	kubectl create configmap stashcache  -n osg --from-file=xrootd-stashcache-cache-server.cfg=stashcache-server.cfg --from-file=Authfile-noauth=Authfile-noauth --from-file=Authfile-auth=Authfile-auth --from-file=stashcache-robots.txt=stashcache-robots.txt --from-file=lcmaps.cfg=lcmaps.cfg --from-file=ligo-voms-mapfile=ligo-voms-mapfile
	-kubectl delete configmap stashcache.d -n osg
	kubectl create configmap stashcache.d  -n osg --from-file=10-k8s-https.cfg --from-file=40-osg-auth.cfg
	-kubectl delete configmap stashcache.d -n osg-services
	kubectl create configmap stashcache.d  -n osg-services --from-file=10-k8s-https.cfg --from-file=40-osg-auth.cfg
	-kubectl delete configmap supervisor.d -n osg-services
	kubectl create configmap supervisor.d -n osg-services --from-file=90-fix-certs-initialization.conf=90-fix-certs-initialization.conf
	-kubectl delete configmap supervisor.d -n osg
	kubectl create configmap supervisor.d -n osg --from-file=90-fix-certs-initialization.conf=90-fix-certs-initialization.conf
	-kubectl delete configmap fixcerts -n osg-services
	kubectl create configmap fixcerts -n osg-services --from-file=fix_certs.sh=fix_certs.sh
	-kubectl delete configmap fixcerts -n osg
	kubectl create configmap fixcerts -n osg --from-file=fix_certs.sh=fix_certs.sh
	-kubectl delete configmap mdisks.cfg -n osg-services
	kubectl create configmap mdisks.cfg -n osg-services --from-file=92-disks.cfg=92-disks.cfg
pushsecrets:
	-kubectl delete secret houston-certs -n osg-services
	kubectl create secret generic houston-certs -n osg-services --from-file=hostcert=houstonCerts/hostcert.pem --from-file=hostkey=houstonCerts/hostkey.pem
	-kubectl delete secret kisti-certs -n osg-services
	kubectl create secret generic kisti-certs -n osg-services --from-file=hostcert=kisti-cache-certs/hostcert.pem --from-file=hostkey=kisti-cache-certs/hostkey.pem
	-kubectl delete secret amsterdam-certs -n osg-services
	kubectl create secret generic amsterdam-certs -n osg-services --from-file=hostcert=amsterdam-certs/hostcert.pem --from-file=hostkey=amsterdam-certs/hostkey.pem
	-kubectl delete secret cardiff-certs -n osg-services
	kubectl create secret generic cardiff-certs -n osg-services --from-file=hostcert=cardiff-certs/hostcert.pem --from-file=hostkey=cardiff-certs/hostkey.pem
	-kubectl delete secret ucsd-certs -n osg-services
	kubectl create secret generic ucsd-certs -n osg-services --from-file=hostcert=ucsd-certs/hostcert.pem --from-file=hostkey=ucsd-certs/hostkey.pem
	-kubectl delete secret sunnyvale-certs -n osg-services
	kubectl create secret generic sunnyvale-certs -n osg-services --from-file=hostcert=sunnyvale-certs/hostcert.pem --from-file=hostkey=sunnyvale-certs/hostkey.pem
	-kubectl delete secret kansascity-certs -n osg-services
	kubectl create secret generic kansascity-certs -n osg-services --from-file=hostcert=kansascity-certs/hostcert.pem --from-file=hostkey=kansascity-certs/hostkey.pem
	-kubectl delete secret chicago-certs -n osg-services
	kubectl create secret generic chicago-certs -n osg-services --from-file=hostcert=chicago-certs/hostcert.pem --from-file=hostkey=chicago-c\
erts/hostkey.pem
	-kubectl delete secret newyork-certs -n osg-services
	kubectl create secret generic newyork-certs -n osg-services --from-file=hostcert=new-york-certs/hostcert.pem --from-file=hostkey=new-york-c\
erts/hostkey.pem
