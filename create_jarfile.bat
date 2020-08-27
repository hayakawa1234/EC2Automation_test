cd C:\Users\hayakawa\Documents\GitHub\OysterWorld

del C:\Users\hayakawa\Documents\GitHub\OysterWorld\build\libs\oysterworld.jar

gradlew build -x test && cd C:\Users\hayakawa\Documents\GitHub\OysterWorld\build\libs && rename oysterworld-0.0.1-SNAPSHOT.jar oysterworld.jar
