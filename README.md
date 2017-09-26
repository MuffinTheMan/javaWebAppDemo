## Use Spring
   - See https://spring.io/guides/gs/serving-web-content/
   - `vagrant plugin install vagrant-vbguest`
   - `vagrant up`
   - `vagrant ssh`
   - `sudo yum install -y java-sdk`
   - `cd /app`
   - Put Java app in shared folder and build it on the host machine (e.g. `./gradlew build`)
   - Run it in the guest machine `java -jar build/libs/gs-serving-web-content-0.1.0.jar` for example
   - View on host at http://localhost:8080

## Incorporate Foundation
- Link to Foundation files for css/js in views/templates