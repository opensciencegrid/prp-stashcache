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
	-kubectl delete configmap mdisks.cfg -n osg
	kubectl create configmap mdisks.cfg -n osg --from-file=92-disks.cfg=92-disks.cfg
pushsecrets:
	-kubectl delete secret houston-certs -n osg-services
	kubectl create secret generic houston-certs -n osg-services --from-file=hostcert=houstonCerts/hostcert.pem --from-file=hostkey=houstonCerts/hostkey.pem

