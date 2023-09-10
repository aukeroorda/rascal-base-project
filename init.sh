# Initializing base Rascal project

# Maven setup
mvn archetype:generate \
    -DgroupId=com.mycompany.app \
    -DartifactId=my-app \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DarchetypeVersion=1.4 \
    -DinteractiveMode=false

# Continue working in the `my-app` directory
(
  cd my-app

  # Create a directory to hold the Rascal project information:
  mkdir META-INF && cd META-INF 

  # Construct the Rascal project configuration file RASCAL.MF. Note that the file has to end with two newlines due to some issue. The library rascal-lsp is included as an example.
  echo "Manifest-Version: 0.0.1
Project-Name: my-app
Source: src/main/rascal
Require-Libraries: |lib://rascal-lsp|


" > RASCAL.MF
)