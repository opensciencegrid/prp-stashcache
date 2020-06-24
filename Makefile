pushconfig:
	-kubectl delete configmap mdisks.cfg -n osg-services
	kubectl create configmap mdisks.cfg -n osg-services --from-file=92-disks.cfg=92-disks.cfg
	-kubectl delete configmap sunnyvaledisks -n osg-services
	kubectl create configmap sunnyvaledisks -n osg-services --from-file=90-cache-disks.cfg=90-sunnyvale-cache-disks.cfg
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
