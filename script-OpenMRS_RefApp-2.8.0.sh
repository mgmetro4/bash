#!/bin/bash

# OpenMRS Reference Application 2.8.0
# Core 2.1.3

githubs="/home/openmrs/Desktop/modules"
tomcat8="/var/lib/tomcat8"
openmrs="$tomcat8/.OpenMRS"
war_location="$tomcat8/webapps/openmrs/"
modules_location="$openmrs/modules"
owa_location="$openmrs/owa"

#bash cannot do multi dimensional arrays, so typing this out the long way

#make sure you type in sudo password before walking away; e.g: sudo ls

#You need to install openjdk-8-jdk, nodejs, npm, maven, and tomcat8 first

#start/stop tomcat8 with sudo service tomcat8 stop

download_githubs=false
clean_install=false

### Core ###
name=core-2.1.3
version=2.1.3
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-core.git
	mv ./openmrs-core ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo unzip ./webapp/target/openmrs.war -d "war_location"
fi


### SystemAdministration OWA ###
### NOT WORKING ###
#Use"SystemAdministration.owa" or it won't work. Bug in OWA module gives bad URL (URL = directory name)
name=SystemAdministration-OWA-1.1
version=v1.1
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-owa-sysadmin.git
	mv ./openmrs-owa-sysadmin ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
#if [ "$clean_install" = "true" ]; then
#	cd "$githubs/$name"
#	sudo npm install -g gulp bower
#	sudo npm install && bower install
#	gulp
#	sudo cp ./owa/target/*.owa "/$owa_location/SystemAdministration.owa" 
#fi


### Modules ###

#address hierarchy
name=addresshierarchy-2.11.0
version=2.11.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-addresshierarchy.git
	mv ./openmrs-module-addresshierarchy ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod" 
fi

#adminui
name=adminui-1.2.3
version=1.2.3
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-adminui.git
	mv ./openmrs-module-adminui ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod" 
fi

#allergyui
name=allergyui-1.8.1
version=1.8.1
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-allergyui.git
	mv ./openmrs-module-allergyui ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod" 
fi

#adminui
name=adminui-1.2.3
version=1.2.3
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-adminui.git
	mv ./openmrs-module-adminui ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#appframework
name=appframework-2.11.0
version=2.11.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-appframework.git
	mv ./openmrs-module-appframework ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#appointmentscheduling
name=appointmentscheduling-1.9.0
version=1.9.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-appointmentscheduling.git
	mv ./openmrs-module-appointmentscheduling ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#appointmentschedulingui
name=appointmentschedulingui-1.7.0
version=1.7.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-appointmentschedulingui.git
	mv ./openmrs-module-appointmentschedulingui ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#appui
name=appui-1.8.0
version=1.8.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-appui.git
	mv ./openmrs-module-appui ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#atlas
name=atlas-2.2
version=atlas-2.2
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-atlas.git
	mv ./openmrs-module-atlas ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#calculation
name=calculation-1.2
version=1.2
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-calculation.git
	mv ./openmrs-module-calculation ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#chartsearch
name=chartsearch-2.1.0
version=2.1.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-chartsearch.git
	mv ./openmrs-module-chartsearch ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#coreapps
name=coreapps-1.19.0
version=1.19.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-coreapps.git
	mv ./openmrs-module-coreapps ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#dataexchange
name=dataexchange-1.3.2
version=1.3.2
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-dataexchange.git
	mv ./openmrs-module-dataexchange ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#emrapi
name=emrapi-1.24.4
version=1.24.4
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-emrapi.git
	mv ./openmrs-module-emrapi ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#event
name=event-2.6.0
version=2.6.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-event.git
	mv ./openmrs-module-event ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#fhir
name=fhir-1.13.0
version=1.13.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-fhir.git
	mv ./openmrs-module-fhir ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#formentryapp
name=formentryapp-1.4.2
version=1.4.2
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-formentryapp.git
	mv ./openmrs-module-formentryapp ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#htmlformentry
name=htmlformentry-3.7.0
version=3.7.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-htmlformentry.git
	mv ./openmrs-module-htmlformentry ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#htmlformentryui
name=htmlformentryui-1.7.0
version=1.7.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-htmlformentryui.git
	mv ./openmrs-module-htmlformentryui ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#htmlwidgets
name=htmlwidgets-1.9.0
version=1.9.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-htmlwidgets.git
	mv ./openmrs-module-htmlwidgets ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#idgen
name=idgen-4.5.0
version=4.5.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-idgen.git
	mv ./openmrs-module-idgen ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#legacyui
name=legacyui-1.4.0
version=1.4.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-legacyui.git
	mv ./openmrs-module-legacyui ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#metadatadeploy
name=metadatadeploy-1.10.0
version=1.10.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-metadatadeploy.git
	mv ./openmrs-module-metadatadeploy ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#metadatamapping
name=metadatamapping-1.3.4
version=1.3.4
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-metadatamapping.git
	mv ./openmrs-module-metadatamapping ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#metadatasharing
name=metadatasharing-1.5.0
version=1.5.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-metadatasharing.git
	mv ./openmrs-module-metadatasharing ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#owa
name=owa-1.9.0
version=1.9.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-owa.git
	mv ./openmrs-module-owa ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#providermanagement
name=providermanagement-2.10.0
version=2.10.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-providermanagement.git
	mv ./openmrs-module-providermanagement ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#referenceapplication
name=referenceapplication-2.8.0
version=referenceapplication-2.8.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-referenceapplication.git
	mv ./openmrs-module-referenceapplication ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#referencedemodata
name=referencedemodata-1.4.4
version=1.4.4
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-referencedemodata.git
	mv ./openmrs-module-referencedemodata ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#referencemetadata
name=referencemetadata-2.8.0
version=referencemetadata-2.8.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-referencemetadata.git
	mv ./openmrs-module-referencemetadata ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#registrationapp
name=registrationapp-1.12.0
version=1.12.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-registrationapp.git
	mv ./openmrs-module-registrationapp ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#registrationcore
name=registrationcore-1.8.0
version=1.8.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-registrationcore.git
	mv ./openmrs-module-registrationcore ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#reporting
name=reporting-1.16.0
version=1.16.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-reporting.git
	mv ./openmrs-module-reporting ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#reportingcompatibility
name=reportingcompatibility-2.0.5
version=2.0.5
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-reportingcompatibility.git
	mv ./openmrs-module-reportingcompatibility ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#reportingrest
name=reportingrest-1.10.0
version=1.10.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-reportingrest.git
	mv ./openmrs-module-reportingrest ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#reportingui
name=reportingui-1.6.0
version=1.6.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-reportingui.git
	mv ./openmrs-module-reportingui ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#serialization.xstream
name=serialization.xstream-0.2.14
version=0.2.14
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-serialization.xstream.git
	mv ./openmrs-module-serialization.xstream ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#uicommons
name=uicommons-2.6.0
version=2.6.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-uicommons.git
	mv ./openmrs-module-uicommons ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#uiframework
name=uiframework-3.13.0
version=3.13.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-uiframework.git
	mv ./openmrs-module-uiframework ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#uilibrary
name=uilibrary-2.0.6
version=2.0.6
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-uilibrary.git
	mv ./openmrs-module-uilibrary ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi

#webservices.rest
name=webservices.rest-2.22.0
version=2.22.0
if [ "$download_githubs" = "true" ]; then
	cd "$githubs"
	git clone https://github.com/openmrs/openmrs-module-webservices.rest.git
	mv ./openmrs-module-webservices.rest ./$name
	cd ./$name
	git checkout tags/$version -b $version
fi
if [ "$clean_install" = "true" ]; then
	cd "$githubs/$name"
	mvn clean install
	sudo cp ./omod/target/*.omod "/$modules_location/$name.omod"
fi