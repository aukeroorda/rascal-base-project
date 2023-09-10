# Initializing base Rascal project

# Maven setup
mvn archetype:generate \
    -DgroupId=com.mycompany.app \
    -DartifactId=my-app \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DarchetypeVersion=1.4 \
    -DinteractiveMode=false

# Continue working in the `my-app` directory.
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

  # Move out of the META-INF folder
  cd ..

  # I think (but am unsure) that in general the Rascal code should reside under `src/main/rascal`, but I could be wrong in this regard. Note that this is also the path that we gave for the `Source` field in the RASCAL.MF config.
  # Construct this directory
  mkdir -p src/main/rascal 

  # Construct a Rascal source file
  echo "module Syntax

extend lang::std::Layout;
extend lang::std::Id;

start syntax Machine = machine: State+ states;
syntax State = @Foldable state: "state" Id name Trans* out;
syntax Trans = trans: Id event ":" Id to;" > src/main/rascal/Syntax.rsc

  # You should now be able to import this module in a Rascal console in either of two ways:
    # Click Import in new Rascal terminal at the top of the Syntax.rsc source file
    # or Open a Rascal Terminal yourself (cmd/ctrl + shift + P > Create Rascal Terminal), and import using import Syntax;.
)