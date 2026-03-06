puts "Seeding programs..."


images_path = Rails.root.join("app/assets/images")

program_data = [
  {
    workout: "Legs",
    image: "leg.jpg",
    description: "Programme Legs\n🎯 Objectif\nDevelopper la puissance et la masse musculaire du bas du corps.\n💥 Muscles cibles\n\nQuadriceps\nIschio-jambiers\nFessiers\nMollets\n🏋️ Exemple d'exercices\n\nSquat\nPresse a cuisses\nSouleve de terre jambes tendues\nFentes\n📆 Ideal pour\nCompleter un programme Push / Pull pour un developpement equilibre."
  },
  {
    workout: "Push",
    image: "push.jpg",
    description: "🔴 Programme Push\n🎯 Objectif\nTravailler tous les muscles impliques dans les mouvements de poussee.\n💥 Muscles cibles\n\nPectoraux\nEpaules (deltoides)\nTriceps\n🏋️ Exemple d'exercices\n\nDeveloppe couche\nDeveloppe militaire\nDips\nElevations laterales\n📆 Ideal pour\nProgramme en split type Push / Pull / Legs (3 a 6 seances par semaine)."
  },
  {
    workout: "Pull",
    image: "pull.jpg",
    description: "🔵 Programme Pull\n🎯 Objectif\nTravailler tous les muscles impliques dans les mouvements de tirage.\n💥 Muscles cibles\n\nDos\nBiceps\nArriere d'epaules\n🏋️ Exemple d'exercices\n\nTractions\nTirage horizontal\nRowing barre\nCurl biceps\n📆 Ideal pour\nComplement du programme Push dans un split structure."
  },
  {
    workout: "Upper",
    image: "top.jpg",
    description: "🟣 Programme Upper\n🎯 Objectif\nSeparer le haut et le bas du corps sur differentes seances.\n💥 Upper (Haut du corps)\n\nPectoraux\nDos\nEpaules\nBras\n\n📆 Ideal pour\n2 seances par semaine.\nExcellent equilibre entre volume et recuperation."
  },
  {
    workout: "Lower",
    image: "lower.jpg",
    description: "🟠 Programme Lower\n🎯 Objectif\nSeparer le haut et le bas du corps sur differentes seances.\n💥 Lower (Bas du corps)\n\nQuadriceps\nIschio-jambiers\nFessiers\nMollets\n📆 Ideal pour\n2 seances par semaine.\nExcellent equilibre entre volume et recuperation."
  },
  {
    workout: "Full body",
    image: "full_body.jpg",
    description: "🟡 Programme Full Body\n🎯 Objectif\nTravailler l'ensemble du corps a chaque seance.\n💥 Muscles cibles\nTous les groupes musculaires majeurs.\n🏋️ Avantages\n\n📆 Ideal pour les debutants\nParfait pour 2 a 3 seances par semaine\nFavorise la progression rapide"
  }
]

program_data.each do |data|
  program = Program.find_or_create_by!(workout: data[:workout])
  program.update!(description: data[:description])

  unless program.image.attached?
    path = images_path.join(data[:image])
    program.image.attach(
      io: File.open(path),
      filename: data[:image],
      content_type: "image/jpeg"
    )
    puts "  Image attachee: #{data[:workout]} -> #{data[:image]}"
  else
    puts "  Image deja presente: #{data[:workout]}"
  end
end

puts "Done! #{Program.count} programs."
