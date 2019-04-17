pushservicecerts:
	-kubectl delete secret servicecerts -n osg # delete if already exists, ignore errors
	kubectl create secret generic servicecerts -n osg --from-file=hostcerts/xrdkey.pem --from-file=hostcerts/xrdcert.pem

pushcerts:
	-kubectl delete secret certs -n osg # delete if already exists, ignore errors                                                                                       
	kubectl create secret generic certs -n osg --from-file=hostcerts/hostcert.pem --from-file=hostcerts/hostkey.pem

pushconfig:
	-kubectl delete configmap stashcache -n osg  # delete if already exists, ignore errors
	kubectl create configmap stashcache  -n osg --from-file=xrootd-stashcache-cache-server.cfg=stashcache-server.cfg --from-file=Authfile-noauth=Authfile-noauth --from-file=Authfile-auth=Authfile-auth --from-file=stashcache-robots.txt=stashcache-robots.txt --from-file=lcmaps.cfg=lcmaps.cfg --from-file=ligo-voms-mapfile=ligo-voms-mapfile
	-kubectl delete configmap stashcache.d -n osg
	kubectl create configmap stashcache.d  -n osg --from-file=40-osg-http.cfg=40-osg-http.cfg
	-kubectl delete configmap supervisor.d -n osg
	kubectl create configmap supervisor.d -n osg --from-file=90-fix-certs-initialization.conf=90-fix-certs-initialization.conf
	-kubectl delete configmap fixcerts -n osg
	kubectl create configmap fixcerts -n osg --from-file=fix_certs.sh=fix_certs.sh
