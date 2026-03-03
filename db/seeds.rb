# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Program.destroy_all

# 2. Create the instances 🏗️
puts "Creating programs..."
Program.create!(workout: "Legs", description: "Programme Legs
🎯 Objectif
Développer la puissance et la masse musculaire du bas du corps.
💥 Muscles ciblés

Quadriceps
Ischio-jambiers
Fessiers
Mollets
🏋️‍♂️ Exemple d’exercices

Squat
Presse à cuisses
Soulevé de terre jambes tendues
Fentes
📆 Idéal pour
Compléter un programme Push / Pull pour un développement équilibré.")
Program.create!(workout: "Push", description: "🔴 Programme Push
🎯 Objectif
Travailler tous les muscles impliqués dans les mouvements de poussée.
💥 Muscles ciblés

Pectoraux
Épaules (deltoïdes)
Triceps
🏋️‍♂️ Exemple d’exercices

Développé couché
Développé militaire
Dips
Élévations latérales
📆 Idéal pour
Programme en split type Push / Pull / Legs (3 à 6 séances par semaine).")
Program.create!(workout: "Pull", description: "🔵 Programme Pull
🎯 Objectif
Travailler tous les muscles impliqués dans les mouvements de tirage.
💥 Muscles ciblés

Dos
Biceps
Arrière d’épaules
🏋️‍♂️ Exemple d’exercices

Tractions
Tirage horizontal
Rowing barre
Curl biceps
📆 Idéal pour
Complément du programme Push dans un split structuré.")
Program.create!(workout: "Upper", description: "🟣 Programme Upper
🎯 Objectif
Séparer le haut et le bas du corps sur différentes séances.
💥 Upper (Haut du corps)

Pectoraux
Dos
Épaules
Bras


📆 Idéal pour
2 séances par semaine .
 Excellent équilibre entre volume et récupération.")
Program.create!(workout: "Lower", description: "🟠 Programme Lower
🎯 Objectif
Séparer le haut et le bas du corps sur différentes séances.
💥 Lower (Bas du corps)

Quadriceps
Ischio-jambiers
Fessiers
Mollets
📆 Idéal pour
2 séances par semaine.
 Excellent équilibre entre volume et récupération.")
Program.create!(workout: "Full body", description: "🟡 Programme Full Body
🎯 Objectif
Travailler l’ensemble du corps à chaque séance.
💥 Muscles ciblés
Tous les groupes musculaires majeurs.
🏋️‍♂️ Avantages

📆 Idéal pour les débutants
Parfait pour 2 à 3 séances par semaine
Favorise la progression rapide")

# 3. Display a message 🎉
puts "Finished! Created #{Program.count} programs."
