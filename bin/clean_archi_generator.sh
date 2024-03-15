#!/bin/bash

# Récupérer le premier paramètre qui est le nom du dossier
DIRECTORY_NAME=$1

# Vérifier si le paramètre est vide
if [ -z "$DIRECTORY_NAME" ]; then
    echo "Usage: clean_archi_generator.sh <directory_name>"
    exit 1
fi

# Convertir le nom en majuscule camelCase
UPPER_CAMEL_CASE_NAME=$(echo "$DIRECTORY_NAME" | sed -r 's/(^|-)([a-z])/\U\2/g')

# Créer la structure de dossiers
mkdir -p "$DIRECTORY_NAME"/{data/{data_sources,models,repositories},domain/{entities,repositories,usecases},presentation/{pages,widgets,providers}}

# Créer les fichiers vides
touch "$DIRECTORY_NAME"/data/data_sources/{remote_data_source.dart,local_data_source.dart}
touch "$DIRECTORY_NAME"/data/models/"$DIRECTORY_NAME"_model.dart
touch "$DIRECTORY_NAME"/data/repositories/"$DIRECTORY_NAME"_repository.dart
touch "$DIRECTORY_NAME"/domain/repositories/repositories.dart

# Créer le fichier provider
touch "$DIRECTORY_NAME"/presentation/providers/"$DIRECTORY_NAME"_provider.dart

# Écrire le contenu de la classe Provider
echo "import 'package:flutter/foundation.dart';" >> "$DIRECTORY_NAME"/presentation/providers/"$DIRECTORY_NAME"_provider.dart
echo "" >> "$DIRECTORY_NAME"/presentation/providers/"$DIRECTORY_NAME"_provider.dart
echo "class ${UPPER_CAMEL_CASE_NAME}Provider with ChangeNotifier {" >> "$DIRECTORY_NAME"/presentation/providers/"$DIRECTORY_NAME"_provider.dart
echo "" >> "$DIRECTORY_NAME"/presentation/providers/"$DIRECTORY_NAME"_provider.dart
echo "}" >> "$DIRECTORY_NAME"/presentation/providers/"$DIRECTORY_NAME"_provider.dart

echo "Clean architecture for $DIRECTORY_NAME created successfully!"
