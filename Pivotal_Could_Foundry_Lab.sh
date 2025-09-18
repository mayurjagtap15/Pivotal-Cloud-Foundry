#------------------------------------------------------------------------------------------------------------------------------------------------------
# Install Pivotal Clound Foundry CLI 
#  https://docs.cloudfoundry.org/cf-cli/getting-started.html
# Reference git repo :-  https://github.com/codefarm0/PivotalCloudFoundry
#  https://docs.cloudfoundry.org/cf-cli/v7.html
#------------------------------------------------------------------------------------------------------------------------------------------------------

wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo gpg --dearmor -o /usr/share/keyrings/cli.cloudfoundry.org.gpg
echo "deb [signed-by=/usr/share/keyrings/cli.cloudfoundry.org.gpg] https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list

sudo apt-get update

root@ip-172-31-24-54:/home/ubuntu# wget -O cf-cli_7.deb https://packages.cloudfoundry.org/stable?release=debian64&version=7&source=github^C
root@ip-172-31-24-54:/home/ubuntu# ls
cf-cli_7.deb
sudo dpkg -i cf-cli_7.deb
sudo apt-get install -f
root@ip-172-31-24-54:/home/ubuntu# cf version
cf version 8.14.1+2bcb856.2025-06-10
cf help -a
#------------------------------------------------------------------------------------------------------------------------------------------------------
# login to below account get API endpoint
# https://cockpit.hanatrial.ondemand.com/trial/#/globalaccount/ccdceb30-855c-4753-a94a-b88a352cb60a/subaccount/6736ddd7-af51-4e74-a0e4-83d4b8d9cada/subaccountoverview
#------------------------------------------------------------------------------------------------------------------------------------------------------
# Needed to create above account
# https://support.broadcom.com/group/ecx/my-dashboard
# https://www.sap.com/dashboard.gate.html
#------------------------------------------------------------------------------------------------------------------------------------------------------

root@ip-172-31-24-54:/home/ubuntu# cf version
cf version 8.14.1+2bcb856.2025-06-10
root@ip-172-31-24-54:/home/ubuntu# cf login
API endpoint: https://api.cf.us10-001.hana.ondemand.com

Email: mayurjagtap04@gmail.com
Password:

Authenticating...
OK

Targeted org 24a32a62trial.

Targeted space dev.
#------------------------------------------------------------------------------------------------------------------------------------------------------

#Create space for Test and login again.
# https://cockpit.hanatrial.ondemand.com/trial/#/globalaccount/ccdceb30-855c-4753-a94a-b88a352cb60a/subaccount/6736ddd7-af51-4e74-a0e4-83d4b8d9cada/subaccountoverview

root@ip-172-31-24-54:/home/ubuntu# cf login
API endpoint: https://api.cf.us10-001.hana.ondemand.com

Email: mayurjagtap04@gmail.com
Password:

Authenticating...
OK

Targeted org 24a32a62trial.

Select a space:
1. dev
2. Test-Environment

Space (enter to skip): 2
Targeted space Test-Environment.

API endpoint:   https://api.cf.us10-001.hana.ondemand.com
API version:    3.200.0
user:           mayurjagtap04@gmail.com
org:            24a32a62trial
space:          Test-Environment
root@ip-172-31-24-54:/home/ubuntu#


#------------------------------------------------------------------------------------------------------------------------------------------------------
# cf Commands

root@ip-172-31-24-54:/home/ubuntu# cf apps
Getting apps in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...
No apps found
root@ip-172-31-24-54:/home/ubuntu#
#------------------------------------------------------------------------------------------------------------------------------------------------------
# Deploy First App 

git clone https://github.com/mayurjagtap15/secretsanta-generator.git

#install maven 
mvn package
#inside folder run mvn command to create jar file 
root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# ls
classes            generated-test-sources  maven-status                    secretsanta-0.0.1-SNAPSHOT.jar.original  test-classes
generated-sources  maven-archiver          secretsanta-0.0.1-SNAPSHOT.jar  surefire-reports

#------------------------------------------------------------------------------------------------------------------------------------------------------

#Go to target folder 

root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf push secretsanta -p secretsanta-0.0.1-SNAPSHOT.jar

root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf push secretsanta -p secretsanta-0.0.1-SNAPSHOT.jar
Pushing app secretsanta to org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...
Packaging files to upload...
Uploading files...
 526.86 KiB / 526.86 KiB [=================================================================================================================================================] 100.00% 1s

Waiting for API to complete processing files...

Staging app and tracing logs...
   Downloading zero_trust_sidecar_buildpack_1_11...
   Downloading go_buildpack...
   Downloading sap_java_buildpack_1_114...
   Downloading nodejs_buildpack...
   Downloading staticfile_buildpack...
   Downloaded nodejs_buildpack
   Downloading java_buildpack...
   Downloaded go_buildpack
   Downloaded staticfile_buildpack
   Downloading sap_java_buildpack_jakarta_2_37...
   Downloaded zero_trust_sidecar_buildpack_1_11
   Downloading sap_java_buildpack_jakarta...
   Downloaded sap_java_buildpack_1_114
   Downloading sap_java_buildpack_jakarta_2_39...
   Downloading sap_java_buildpack_jakarta_2_38...
   Downloaded sap_java_buildpack_jakarta
   Downloading zero_trust_sidecar_buildpack_1_10...
   Downloaded java_buildpack
   Downloading zero_trust_sidecar_buildpack_1_9...
   Downloaded sap_java_buildpack_jakarta_2_37
   Downloading zero_trust_sidecar_buildpack...
   Downloaded zero_trust_sidecar_buildpack_1_10
   Downloading sap_java_buildpack...
   Downloaded sap_java_buildpack_jakarta_2_39
   Downloading binary_buildpack...
   Downloaded zero_trust_sidecar_buildpack
   Downloading python_buildpack...
   Downloaded sap_java_buildpack_jakarta_2_38
   Downloading sap_java_buildpack_1_115...
   Downloaded zero_trust_sidecar_buildpack_1_9
   Downloading php_buildpack...
   Downloaded binary_buildpack
   Downloading nginx_buildpack...
   Downloaded sap_java_buildpack_1_115
   Downloaded sap_java_buildpack
   Downloaded php_buildpack
   Downloaded nginx_buildpack
   Downloaded python_buildpack
   Cell 684caff8-89cd-492b-be01-b3d0835f1763 creating container for instance b57aeb34-f3e1-4e8a-8230-920e46d8fc6e
   Security group rules were updated
   Cell 684caff8-89cd-492b-be01-b3d0835f1763 successfully created container for instance b57aeb34-f3e1-4e8a-8230-920e46d8fc6e
   Downloading app package...
   Downloaded app package (33.7M)
   -----> Java Buildpack v4.77.0 (offline) | https://github.com/cloudfoundry/java-buildpack.git#1194e2c3
   -----> Downloading Jvmkill Agent 1.17.0_RELEASE from https://java-buildpack.cloudfoundry.org/jvmkill/jammy/x86_64/jvmkill-1.17.0-RELEASE.so (found in cache)
   -----> Downloading Open Jdk JRE 1.8.0_452 from https://java-buildpack.cloudfoundry.org/openjdk/jammy/x86_64/bellsoft-jre8u452%2B11-linux-amd64.tar.gz (found in cache)
   Expanding Open Jdk JRE to .java-buildpack/open_jdk_jre (0.6s)
   JVM DNS caching disabled in lieu of BOSH DNS caching
   -----> Downloading Open JDK Like Memory Calculator 3.13.0_RELEASE from https://java-buildpack.cloudfoundry.org/memory-calculator/jammy/x86_64/memory-calculator-3.13.0-RELEASE.tar.gz (found in cache)
   Loaded Classes: 16764, Threads: 250
   -----> Downloading Client Certificate Mapper 2.0.1 from https://java-buildpack.cloudfoundry.org/client-certificate-mapper/client-certificate-mapper-2.0.1.jar (found in cache)
   -----> Downloading Container Security Provider 1.20.0_RELEASE from https://java-buildpack.cloudfoundry.org/container-security-provider/container-security-provider-1.20.0-RELEASE.jar (found in cache)
   -----> Downloading Spring Auto Reconfiguration 2.12.0_RELEASE from https://java-buildpack.cloudfoundry.org/auto-reconfiguration/auto-reconfiguration-2.12.0-RELEASE.jar (found in cache)
   [SpringAutoReconfiguration]      WARN  ATTENTION: The Spring Auto Reconfiguration and shaded Spring Cloud Connectors libraries are being installed. These projects have been deprecated, are no longer receiving updates and should not be used going forward.
   [SpringAutoReconfiguration]      WARN  If you are not using these libraries, set `JBP_CONFIG_SPRING_AUTO_RECONFIGURATION='{enabled: false}'` to disable their installation and clear this warning message. The buildpack will switch its default to disable by default after March 2023. Spring Auto Reconfiguration and its shaded Spring Cloud Connectors will be removed from the buildpack after March 2024.
   [SpringAutoReconfiguration]      WARN  If you are using these libraries, please migrate to java-cfenv immediately. See https://via.vmw.com/EiBW for migration instructions. Once you upgrade this message will go away.
   Exit status 0
   Uploading droplet, build artifacts cache...
   Uploading droplet...
   Uploading build artifacts cache...
   Uploaded build artifacts cache (131B)
   Uploaded droplet (78.8M)
   Uploading complete

Waiting for app secretsanta to start...

Instances starting...
Instances starting...
Instances starting...
Instances starting...
Instances starting...

name:                secretsanta
requested state:     started
isolation segment:   trial
routes:              secretsanta.cfapps.us10-001.hana.ondemand.com
last uploaded:       Thu 18 Sep 04:02:11 UTC 2025
stack:               cflinuxfs4
buildpacks:
isolation segment:   trial
        name             version                                                                       detect output   buildpack name
        java_buildpack   v4.77.0-offline-https://github.com/cloudfoundry/java-buildpack.git#1194e2c3   java            java

type:            web
sidecars:
instances:       1/1
memory usage:    1024M
start command:   JAVA_OPTS="-agentpath:$PWD/.java-buildpack/open_jdk_jre/bin/jvmkill-1.17.0_RELEASE=printHeapHistogram=1 -Djava.io.tmpdir=$TMPDIR -XX:ActiveProcessorCount=$(nproc)
                 -Djava.ext.dirs=$PWD/.java-buildpack/container_security_provider:$PWD/.java-buildpack/open_jdk_jre/lib/ext
                 -Djava.security.properties=$PWD/.java-buildpack/java_security/java.security $JAVA_OPTS" &&
                 CALCULATED_MEMORY=$($PWD/.java-buildpack/open_jdk_jre/bin/java-buildpack-memory-calculator-3.13.0_RELEASE -totMemory=$MEMORY_LIMIT -loadedClasses=17869
                 -poolType=metaspace -stackThreads=250 -vmOptions="$JAVA_OPTS") && echo JVM Memory Configuration: $CALCULATED_MEMORY && JAVA_OPTS="$JAVA_OPTS $CALCULATED_MEMORY" &&
                 MALLOC_ARENA_MAX=2 SERVER_PORT=$PORT eval exec $PWD/.java-buildpack/open_jdk_jre/bin/java $JAVA_OPTS -cp $PWD/. org.springframework.boot.loader.JarLauncher
     state     since                  cpu    memory     disk       logging        cpu entitlement   details
#0   running   2025-09-18T04:02:29Z   0.0%   0B of 0B   0B of 0B   0B/s of 0B/s   0.0%

type:            task
sidecars:
instances:       0/0
memory usage:    1024M
start command:   JAVA_OPTS="-agentpath:$PWD/.java-buildpack/open_jdk_jre/bin/jvmkill-1.17.0_RELEASE=printHeapHistogram=1 -Djava.io.tmpdir=$TMPDIR -XX:ActiveProcessorCount=$(nproc)
                 -Djava.ext.dirs=$PWD/.java-buildpack/container_security_provider:$PWD/.java-buildpack/open_jdk_jre/lib/ext
                 -Djava.security.properties=$PWD/.java-buildpack/java_security/java.security $JAVA_OPTS" &&
                 CALCULATED_MEMORY=$($PWD/.java-buildpack/open_jdk_jre/bin/java-buildpack-memory-calculator-3.13.0_RELEASE -totMemory=$MEMORY_LIMIT -loadedClasses=17869
                 -poolType=metaspace -stackThreads=250 -vmOptions="$JAVA_OPTS") && echo JVM Memory Configuration: $CALCULATED_MEMORY && JAVA_OPTS="$JAVA_OPTS $CALCULATED_MEMORY" &&
                 MALLOC_ARENA_MAX=2 SERVER_PORT=$PORT eval exec $PWD/.java-buildpack/open_jdk_jre/bin/java $JAVA_OPTS -cp $PWD/. org.springframework.boot.loader.JarLauncher
There are no running instances of this process.
root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target#
#------------------------------------------------------------------------------------------------------------------------------------------------------

# Use URL for App : secretsanta.cfapps.us10-001.hana.ondemand.com from deployment logs. See below

name:                secretsanta
requested state:     started
isolation segment:   trial
routes:              secretsanta.cfapps.us10-001.hana.ondemand.com
last uploaded:       Thu 18 Sep 04:02:11 UTC 2025
stack:               cflinuxfs4
buildpacks:
isolation segment:   trial

#------------------------------------------------------------------------------------------------------------------------------------------------------

# App Status 

root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf app secretsanta
Showing health and status for app secretsanta in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

name:                secretsanta
requested state:     started
isolation segment:   trial
routes:              secretsanta.cfapps.us10-001.hana.ondemand.com
last uploaded:       Thu 18 Sep 04:02:11 UTC 2025
stack:               cflinuxfs4
buildpacks:
isolation segment:   trial
        name             version                                                                       detect output   buildpack name
        java_buildpack   v4.77.0-offline-https://github.com/cloudfoundry/java-buildpack.git#1194e2c3   java            java

type:           web
sidecars:
instances:      1/1
memory usage:   1024M
     state     since                  cpu    memory         disk           logging             cpu entitlement   details
#0   running   2025-09-18T04:02:29Z   1.8%   277.6M of 1G   152.9M of 1G   0B/s of unlimited   7.6%

type:           task
sidecars:
instances:      0/0
memory usage:   1024M
There are no running instances of this process.
#------------------------------------------------------------------------------------------------------------------------------------------------------
root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf apps
Getting apps in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

name          requested state   processes           routes
secretsanta   started           web:1/1, task:0/0   secretsanta.cfapps.us10-001.hana.ondemand.com
#------------------------------------------------------------------------------------------------------------------------------------------------------

#The manifest file in PCF || cf push with Manifest.yml
#create mainfest.yaml file

root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cat mainfest.yaml
applications:
- name: mainfest-app
  path: /home/ubuntu/secretsanta-generator/target/secretsanta-0.0.1-SNAPSHOT.jar
  memory: 800M
  instances: 2
#------------------------------------------------------------------------------------------------------------------------------------------------------
root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf push -f mainfest.yaml
Pushing app mainfest-app to org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...
Applying manifest file mainfest.yaml...

Updating with these attributes...
  ---
  applications:
+ - name: mainfest-app
+   instances: 2
    path: /home/ubuntu/secretsanta-generator/target/secretsanta-0.0.1-SNAPSHOT.jar
    memory: 800M
+   default-route: true
Manifest applied
Packaging files to upload...
Uploading files...
 526.86 KiB / 526.86 KiB [=================================================================================================================================================] 100.00% 1s

name:                mainfest-app
requested state:     started
isolation segment:   trial
routes:              mainfest-app.cfapps.us10-001.hana.ondemand.com
last uploaded:       Thu 18 Sep 04:25:36 UTC 2025
stack:               cflinuxfs4
buildpacks:
isolation segment:   trial

#------------------------------------------------------------------------------------------------------------------------------------------------------

# Auto Scalling 

root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cat autoscalling.yaml
applications:
  - name: scalling-app
    path: /home/ubuntu/secretsanta-generator/target/secretsanta-0.0.1-SNAPSHOT.jar
    memory: 700M
    instances: 1
#------------------------------------------------------------------------------------------------------------------------------------------------------
root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf app scalling-app
Showing health and status for app scalling-app in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

name:                scalling-app
requested state:     started
isolation segment:   trial
routes:              scalling-app.cfapps.us10-001.hana.ondemand.com
last uploaded:       Thu 18 Sep 04:43:06 UTC 2025
stack:               cflinuxfs4
buildpacks:
isolation segment:   trial
        name             version                                                                       detect output   buildpack name
        java_buildpack   v4.77.0-offline-https://github.com/cloudfoundry/java-buildpack.git#1194e2c3   java            java

type:           web
sidecars:
instances:      1/1
memory usage:   700M
     state     since                  cpu    memory           disk           logging             cpu entitlement   details
#0   running   2025-09-18T04:43:20Z   6.9%   268.6M of 700M   152.9M of 1G   0B/s of unlimited   44.0%

type:           task
sidecars:
instances:      0/0
memory usage:   1024M
There are no running instances of this process.
#------------------------------------------------------------------------------------------------------------------------------------------------------
# Horizontal Scalling 
#------------------------------------------------------------------------------------------------------------------------------------------------------
root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf help scale

   cf scale APP_NAME [--process PROCESS] [-i INSTANCES] [-k DISK] [-m MEMORY] [-l LOG_RATE_LIMIT] [-f]
OPTIONS:
   --force, -f          Force restart of app without prompt
   --instances, -i      Number of instances
   -k                   Disk limit (e.g. 256M, 1024M, 1G)
   -l                   Log rate limit per second, in bytes (e.g. 128B, 4K, 1M). -l=-1 represents unlimited
   -m                   Memory limit (e.g. 256M, 1024M, 1G)
   --process            App process to scale (Default: web)

#------------------------------------------------------------------------------------------------------------------------------------------------------
root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf scale scalling-app -i 2
Scaling app scalling-app in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

Instances starting...
Instances starting...

Showing current scale of app scalling-app in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

name:                scalling-app
requested state:     started
isolation segment:   trial
routes:              scalling-app.cfapps.us10-001.hana.ondemand.com
last uploaded:       Thu 18 Sep 04:43:06 UTC 2025
stack:               cflinuxfs4
buildpacks:
isolation segment:   trial
        name             version                                                                       detect output   buildpack name
        java_buildpack   v4.77.0-offline-https://github.com/cloudfoundry/java-buildpack.git#1194e2c3   java            java

type:           web
sidecars:
instances:      1/2
memory usage:   700M
     state      since                  cpu    memory           disk           logging             cpu entitlement   details
#0   running    2025-09-18T04:43:20Z   1.7%   268.4M of 700M   152.9M of 1G   0B/s of unlimited   11.1%
#1   starting   2025-09-18T04:46:04Z   0.0%   0B of 0B         0B of 0B       0B/s of 0B/s        0.0%

type:           task
sidecars:
instances:      0/0
memory usage:   1024M
There are no running instances of this process.


#------------------------------------------------------------------------------------------------------------------------------------------------------
# Vertical Scalling 
#------------------------------------------------------------------------------------------------------------------------------------------------------
cf scale APP_NAME [--process PROCESS] [-i INSTANCES] [-k DISK] [-m MEMORY] [-l LOG_RATE_LIMIT] [-f]
OPTIONS:
   --force, -f          Force restart of app without prompt
   --instances, -i      Number of instances
   -k                   Disk limit (e.g. 256M, 1024M, 1G)
   -l                   Log rate limit per second, in bytes (e.g. 128B, 4K, 1M). -l=-1 represents unlimited
   -m                   Memory limit (e.g. 256M, 1024M, 1G)
   --process            App process to scale (Default: web)
#------------------------------------------------------------------------------------------------------------------------------------------------------
root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf scale scalling-app -k 1500M
Scaling app scalling-app in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

This will cause the app to restart. Are you sure you want to scale scalling-app? [yN]: y

Stopping app scalling-app in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

Starting app scalling-app in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

Instances starting...
Instances starting...
Instances starting...
Instances starting...
Instances starting...

Showing current scale of app scalling-app in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

name:                scalling-app
requested state:     started
isolation segment:   trial
routes:              scalling-app.cfapps.us10-001.hana.ondemand.com
last uploaded:       Thu 18 Sep 04:43:06 UTC 2025
stack:               cflinuxfs4
buildpacks:
isolation segment:   trial
        name             version                                                                       detect output   buildpack name
        java_buildpack   v4.77.0-offline-https://github.com/cloudfoundry/java-buildpack.git#1194e2c3   java            java

type:           web
sidecars:
instances:      1/1
memory usage:   700M
     state     since                  cpu    memory           disk           logging             cpu entitlement   details
#0   running   2025-09-18T04:53:15Z   1.6%   268.8M of 700M   152.9M of 1G   0B/s of unlimited   10.3%

type:           task
sidecars:
instances:      0/0
memory usage:   1024M
There are no running instances of this process.
#------------------------------------------------------------------------------------------------------------------------------------------------------

# Logging in PCF 

# https://docs.cloudfoundry.org/loggregator/architecture.html

root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf logs scalling-app
Retrieving logs for app scalling-app in org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

   2025-09-18T05:32:10.74+0000 [RTR/3] OUT scalling-app.cfapps.us10-001.hana.ondemand.com - [2025-09-18T05:32:10.722911143Z] "GET / HTTP/2.0" 200 0 323 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0" "10.0.136.0:26678" "10.32.2.6:61225" x_forwarded_for:"35.144.46.133, 10.0.136.0" x_forwarded_proto:"https" vcap_request_id:"b8fb3d83-ae6a-43ca-5b91-591aadde8c06" response_time:0.025501 gorouter_time:0.000085 app_id:"1ec90566-397f-4238-a452-ad4d246f73e4" app_index:"0" instance_id:"57341afc-6d72-4e2d-4b80-8609" failed_attempts:0 failed_attempts_time:"-" dns_time:0.000000 dial_time:0.001322 tls_time:0.009895 backend_time:0.025416 local_address:"10.0.129.9:41652" x_cf_routererror:"-" x_correlationid:"-" tenantid:"-" sap_passport:"-" x_scp_request_id:"79a8005c-21be-48ec-923b-2f8c351d9eb8-68CB9920-F48A23" x_cf_app_instance:"-" x_forwarded_host:"-" x_custom_host:"-" x_ssl_client:"-" x_ssl_client_session_id:"-" x_ssl_client_verify:"-" x_ssl_client_subject_dn:"-" x_ssl_client_subject_cn:"-" x_ssl_client_issuer_dn:"-" x_ssl_client_notbefore:"-" x_ssl_client_notafter:"-" x_cf_forwarded_url:"-" traceparent:"-" true_client_ip:"-" x_cf_true_client_ip:"35.144.46.133" x_request_id:"-" x_b3_traceid:"b8fb3d83ae6a43ca5b91591aadde8c06" x_b3_spanid:"5b91591aadde8c06" x_b3_parentspanid:"-" b3:"b8fb3d83ae6a43ca5b91591aadde8c06-5b91591aadde8c06"
   2025-09-18T05:32:12.24+0000 [RTR/3] OUT scalling-app.cfapps.us10-001.hana.ondemand.com - [2025-09-18T05:32:12.226254387Z] "GET /addpeople HTTP/2.0" 200 0 1725 "https://scalling-app.cfapps.us10-001.hana.ondemand.com/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0" "10.0.136.0:38494" "10.32.2.6:61225" x_forwarded_for:"35.144.46.133, 10.0.136.0" x_forwarded_proto:"https" vcap_request_id:"4acd24cb-e259-4f6a-4472-b399ed72779c" response_time:0.017239 gorouter_time:0.000083 app_id:"1ec90566-397f-4238-a452-ad4d246f73e4" app_index:"0" instance_id:"57341afc-6d72-4e2d-4b80-8609" failed_attempts:0 failed_attempts_time:"-" dns_time:0.000000 dial_time:0.000000 tls_time:0.000000 backend_time:0.017155 local_address:"10.0.129.9:41652" x_cf_routererror:"-" x_correlationid:"-" tenantid:"-" sap_passport:"-" x_scp_request_id:"79a8005c-21be-48ec-923b-2f8c351d9eb8-68CB995A-F48C6C" x_cf_app_instance:"-" x_forwarded_host:"-" x_custom_host:"-" x_ssl_client:"-" x_ssl_client_session_id:"-" x_ssl_client_verify:"-" x_ssl_client_subject_dn:"-" x_ssl_client_subject_cn:"-" x_ssl_client_issuer_dn:"-" x_ssl_client_notbefore:"-" x_ssl_client_notafter:"-" x_cf_forwarded_url:"-" traceparent:"-" true_client_ip:"-" x_cf_true_client_ip:"35.144.46.133" x_request_id:"-" x_b3_traceid:"4acd24cbe2594f6a4472b399ed72779c" x_b3_spanid:"4472b399ed72779c" x_b3_parentspanid:"-" b3:"4acd24cbe2594f6a4472b399ed72779c-4472b399ed72779c"
   2025-09-18T05:32:18.59+0000 [RTR/2] OUT scalling-app.cfapps.us10-001.hana.ondemand.com - [2025-09-18T05:32:18.574219766Z] "POST /addpeople HTTP/2.0" 200 8 1972 "https://scalling-app.cfapps.us10-001.hana.ondemand.com/addpeople" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0" "10.0.136.0:36592" "10.32.2.6:61225" x_forwarded_for:"35.144.46.133, 10.0.136.0" x_forwarded_proto:"https" vcap_request_id:"4790398d-896f-4b92-7a73-9f05c6972a94" response_time:0.022977 gorouter_time:0.000068 app_id:"1ec90566-397f-4238-a452-ad4d246f73e4" app_index:"0" instance_id:"57341afc-6d72-4e2d-4b80-8609" failed_attempts:0 failed_attempts_time:"-" dns_time:0.000000 dial_time:0.001204 tls_time:0.005941 backend_time:0.022908 local_address:"10.0.129.8:20540" x_cf_routererror:"-" x_correlationid:"-" tenantid:"-" sap_passport:"-" x_scp_request_id:"79a8005c-21be-48ec-923b-2f8c351d9eb8-68CB995C-F49478" x_cf_app_instance:"-" x_forwarded_host:"-" x_custom_host:"-" x_ssl_client:"-" x_ssl_client_session_id:"-" x_ssl_client_verify:"-" x_ssl_client_subject_dn:"-" x_ssl_client_subject_cn:"-" x_ssl_client_issuer_dn:"-" x_ssl_client_notbefore:"-" x_ssl_client_notafter:"-" x_cf_forwarded_url:"-" traceparent:"-" true_client_ip:"-" x_cf_true_client_ip:"35.144.46.133" x_request_id:"-" x_b3_traceid:"4790398d896f4b927a739f05c6972a94" x_b3_spanid:"7a739f05c6972a94" x_b3_parentspanid:"-" b3:"4790398d896f4b927a739f05c6972a94-7a739f05c6972a94"

#------------------------------------------------------------------------------------------------------------------------------------------------------

# PCF Routes 

root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target# cf routes
Getting routes for org 24a32a62trial / space Test-Environment as mayurjagtap04@gmail.com...

space              host           domain                              port   path   protocol   app-protocol   apps           service instance   options
Test-Environment   scalling-app   cfapps.us10-001.hana.ondemand.com                 http       http1          scalling-app
root@ip-172-31-24-54:/home/ubuntu/secretsanta-generator/target#
