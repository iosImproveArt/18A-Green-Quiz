//
//  QuestionViewModel.swift
//  Spirit Quiz
//
//  Created by Improve on 27.10.2024.
//
import SwiftUI

class QuestionViewModelGQ: ObservableObject {
    let typeOfGame: GameType
    
    var ehngfjmr = "rfc3"
    var hbnegvcfjmk = 35
    func ghtrfjk() -> String {
        return "uhnefrijmko"
    }
    func rj4nufm() {
        print("gnmfr")
    }
    
    @AppStorage("userNickname") var player1 = "IamNewUser"
    @Published var player2 = ""
    @Published var heartCount = 3
    @Published var questionNumber = 1
    
    @Published var player1RightAnswers = 0
    @Published var player2RightAnswers = 0
    
    
    @Published var listOfQuestions: [Question]
    @Published var answer = ""
    
    @Published var showFinishView = false
    @Published var showEnterView = false
    
    var currentQuestion: Question {
        listOfQuestions[questionNumber - 1]
    }
    
    init(typeOfGame: GameType) {
        self.typeOfGame = typeOfGame
        
        if typeOfGame == .withC { player2 = "Computer" }
        if typeOfGame == .withF { showEnterView = true }
        listOfQuestions =  Array(Question.advancedQuestions.shuffled().prefix(20))
    }
    
    func answerTheQuestion(answer: String) {
        self.answer = answer
        
        if answer == currentQuestion.correctAnswer {
            if questionNumber % 2 == 0 { player2RightAnswers += 1 } else { player1RightAnswers += 1 }
        } else if typeOfGame == .oneP {
            heartCount -= 1
            if heartCount <= 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in showFinishView = true }
                return
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            if questionNumber >= 20 {
                showFinishView = true
            } else {
                self.answer = ""
                questionNumber += 1
            }
        }
    }
}


enum GameType {
    case oneP
    case withC
    case withF
}

struct Question {
    let question: String
    let correctAnswer: String
    let answerOptions: [String]
    
    static let advancedQuestions: [Question] = [
        Question(
                question: "What is the chemical symbol for silver?",
                correctAnswer: "Ag",
                answerOptions: ["Ag", "Au", "Cu", "Pb"]
            ),
            Question(
                question: "Which organ in the human body is responsible for filtering blood?",
                correctAnswer: "Kidneys",
                answerOptions: ["Heart", "Lungs", "Liver", "Kidneys"]
            ),
            Question(
                question: "What is the largest animal in the world?",
                correctAnswer: "Blue whale",
                answerOptions: ["Elephant", "Blue whale", "Giraffe", "Sperm whale"]
            ),
            Question(
                question: "Which metal is commonly used for making electrical wires?",
                correctAnswer: "Copper",
                answerOptions: ["Copper", "Iron", "Aluminum", "Silver"]
            ),
            Question(
                question: "Which planet orbits the Sun the fastest?",
                correctAnswer: "Mercury",
                answerOptions: ["Mercury", "Venus", "Mars", "Jupiter"]
            ),
            Question(
                question: "What is the largest desert in the world?",
                correctAnswer: "Sahara",
                answerOptions: ["Sahara", "Gobi", "Kalahari", "Antarctica"]
            ),
            Question(
                question: "Who wrote 'The Testament'?",
                correctAnswer: "Taras Shevchenko",
                answerOptions: ["Lesya Ukrainka", "Ivan Franko", "Taras Shevchenko", "Mykola Khvylovy"]
            ),
            Question(
                question: "What gas do plants release during photosynthesis?",
                correctAnswer: "Oxygen",
                answerOptions: ["Carbon dioxide", "Oxygen", "Hydrogen", "Nitrogen"]
            ),
            Question(
                question: "What is the capital of Germany?",
                correctAnswer: "Berlin",
                answerOptions: ["Munich", "Berlin", "Hamburg", "Cologne"]
            ),
            Question(
                question: "Which element has the atomic number 1?",
                correctAnswer: "Hydrogen",
                answerOptions: ["Hydrogen", "Helium", "Oxygen", "Nitrogen"]
            ),
        Question(
            question: "What is the speed of sound in air at sea level?",
            correctAnswer: "343 m/s",
            answerOptions: ["300 m/s", "343 m/s", "400 m/s", "500 m/s"]
        ),
        Question(
            question: "Which Nobel Prize category was first awarded in 1969?",
            correctAnswer: "Economic Sciences",
            answerOptions: ["Physics", "Literature", "Economic Sciences", "Medicine"]
        ),
        Question(
            question: "What is the primary function of red blood cells?",
            correctAnswer: "To carry oxygen",
            answerOptions: ["To fight infections", "To carry oxygen", "To clot blood", "To regulate temperature"]
        ),
        Question(
            question: "Who painted the ceiling of the Sistine Chapel?",
            correctAnswer: "Michelangelo",
            answerOptions: ["Leonardo da Vinci", "Raphael", "Michelangelo", "Donatello"]
        ),
        Question(
            question: "What is the capital city of Japan?",
            correctAnswer: "Tokyo",
            answerOptions: ["Kyoto", "Tokyo", "Osaka", "Nagoya"]
        ),
        Question(
            question: "What is the term for the study of fungi?",
            correctAnswer: "Mycology",
            answerOptions: ["Entomology", "Mycology", "Botany", "Zoology"]
        ),
        Question(
            question: "What is the SI unit of force?",
            correctAnswer: "Newton",
            answerOptions: ["Pascal", "Newton", "Joule", "Watt"]
        ),
        Question(
            question: "Which country invented gunpowder?",
            correctAnswer: "China",
            answerOptions: ["India", "China", "Greece", "Persia"]
        ),
        Question(
            question: "What is the largest organ in the human body?",
            correctAnswer: "Skin",
            answerOptions: ["Liver", "Heart", "Skin", "Brain"]
        ),
        Question(
            question: "What is the boiling point of water at sea level?",
            correctAnswer: "100°C",
            answerOptions: ["90°C", "100°C", "110°C", "120°C"]
        ),
        Question(
            question: "What is the chemical formula for table salt?",
            correctAnswer: "NaCl",
            answerOptions: ["KCl", "NaCl", "HCl", "NaOH"]
        ),
        Question(
            question: "What is the capital of Italy?",
            correctAnswer: "Rome",
            answerOptions: ["Venice", "Rome", "Florence", "Milan"]
        ),
        Question(
            question: "Which layer of the Earth lies below the crust?",
            correctAnswer: "Mantle",
            answerOptions: ["Core", "Mantle", "Lithosphere", "Asthenosphere"]
        ),
        Question(
            question: "What is the primary greenhouse gas responsible for global warming?",
            correctAnswer: "Carbon Dioxide",
            answerOptions: ["Methane", "Oxygen", "Carbon Dioxide", "Nitrogen"]
        ),
        Question(
            question: "Who wrote the play 'Hamlet'?",
            correctAnswer: "William Shakespeare",
            answerOptions: ["Christopher Marlowe", "William Shakespeare", "John Milton", "Ben Jonson"]
        ),
        Question(
            question: "What is the square root of 144?",
            correctAnswer: "12",
            answerOptions: ["11", "12", "13", "14"]
        ),
        Question(
            question: "What is the largest planet in the Solar System?",
            correctAnswer: "Jupiter",
            answerOptions: ["Earth", "Jupiter", "Saturn", "Uranus"]
        ),
        Question(
            question: "What is the process plants use to convert sunlight into food?",
            correctAnswer: "Photosynthesis",
            answerOptions: ["Respiration", "Photosynthesis", "Digestion", "Transpiration"]
        ),
        Question(
            question: "What is the smallest unit of life?",
            correctAnswer: "Cell",
            answerOptions: ["Atom", "Cell", "Molecule", "Organ"]
        ),
        Question(
            question: "Which planet is the hottest in the Solar System?",
            correctAnswer: "Venus",
            answerOptions: ["Mercury", "Venus", "Mars", "Jupiter"]
        ),
        Question(
            question: "What is the chemical formula for water?",
            correctAnswer: "H₂O",
            answerOptions: ["H₂O", "O₂", "CO₂", "H₂"]
        ),
        Question(
            question: "Who is the author of 'The Origin of Species'?",
            correctAnswer: "Charles Darwin",
            answerOptions: ["Gregor Mendel", "Charles Darwin", "Carl Linnaeus", "Alfred Wallace"]
        ),
        Question(
            question: "What is the name of the largest ocean on Earth?",
            correctAnswer: "Pacific Ocean",
            answerOptions: ["Atlantic Ocean", "Indian Ocean", "Pacific Ocean", "Arctic Ocean"]
        ),
        Question(
            question: "Which element is represented by the symbol 'O'?",
            correctAnswer: "Oxygen",
            answerOptions: ["Oxygen", "Osmium", "Oxalate", "Ozone"]
        ),
        Question(
            question: "Which scientist developed the first vaccine for rabies?",
            correctAnswer: "Louis Pasteur",
            answerOptions: ["Alexander Fleming", "Edward Jenner", "Louis Pasteur", "Marie Curie"]
        ),
        Question(
            question: "What is the capital of France?",
            correctAnswer: "Paris",
            answerOptions: ["Rome", "Paris", "Berlin", "Madrid"]
        ),
        Question(
            question: "What is the atomic number of Hydrogen?",
            correctAnswer: "1",
            answerOptions: ["1", "2", "3", "4"]
        ),
        Question(
            question: "What is the largest mammal on Earth?",
            correctAnswer: "Blue Whale",
            answerOptions: ["Elephant", "Blue Whale", "Giraffe", "Orca"]
        ),
        Question(
            question: "What is the primary ingredient in glass?",
            correctAnswer: "Sand",
            answerOptions: ["Sand", "Silicon", "Salt", "Clay"]
        ),
        Question(
            question: "What is the capital city of Australia?",
            correctAnswer: "Canberra",
            answerOptions: ["Sydney", "Melbourne", "Canberra", "Brisbane"]
        ),
        Question(
            question: "What is the largest bone in the human body?",
            correctAnswer: "Femur",
            answerOptions: ["Femur", "Tibia", "Humerus", "Pelvis"]
        ),
        Question(
            question: "Which gas do plants primarily use during photosynthesis?",
            correctAnswer: "Carbon Dioxide",
            answerOptions: ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"]
        ),
        Question(
            question: "What is the name of the smallest planet in the Solar System?",
            correctAnswer: "Mercury",
            answerOptions: ["Venus", "Mercury", "Mars", "Pluto"]
        ),
        Question(
            question: "Who is known as the father of modern chemistry?",
            correctAnswer: "Antoine Lavoisier",
            answerOptions: ["Dmitri Mendeleev", "Robert Boyle", "Antoine Lavoisier", "John Dalton"]
        ),
        Question(
            question: "What is the main source of energy for life on Earth?",
            correctAnswer: "The Sun",
            answerOptions: ["The Moon", "The Sun", "Volcanoes", "Ocean Currents"]
        ),
        Question(
            question: "What is the longest river in the world?",
            correctAnswer: "The Nile",
            answerOptions: ["The Amazon", "The Nile", "The Yangtze", "The Mississippi"]
        ),
        Question(
            question: "Which organ is responsible for pumping blood throughout the human body?",
            correctAnswer: "Heart",
            answerOptions: ["Lungs", "Heart", "Liver", "Kidneys"]
        ),
        Question(
            question: "What is the name of the closest star to Earth?",
            correctAnswer: "The Sun",
            answerOptions: ["Alpha Centauri", "The Sun", "Sirius", "Proxima Centauri"]
        ),
        Question(
            question: "Who is credited with discovering penicillin?",
            correctAnswer: "Alexander Fleming",
            answerOptions: ["Marie Curie", "Alexander Fleming", "Louis Pasteur", "Gregor Mendel"]
        ),
        Question(
            question: "What is the chemical formula for carbon dioxide?",
            correctAnswer: "CO₂",
            answerOptions: ["CO", "CO₂", "C₂O", "C₃O₂"]
        ),
        Question(
            question: "What is the term for animals that eat both plants and meat?",
            correctAnswer: "Omnivores",
            answerOptions: ["Herbivores", "Omnivores", "Carnivores", "Insectivores"]
        ),
        Question(
            question: "Which country has the largest population in the world?",
            correctAnswer: "China",
            answerOptions: ["India", "China", "United States", "Indonesia"]
        ),
        Question(
            question: "What is the name of the instrument used to measure atmospheric pressure?",
            correctAnswer: "Barometer",
            answerOptions: ["Thermometer", "Barometer", "Hygrometer", "Anemometer"]
        ),
        Question(
            question: "Which process converts sugar into alcohol?",
            correctAnswer: "Fermentation",
            answerOptions: ["Photosynthesis", "Fermentation", "Oxidation", "Condensation"]
        ),
        Question(
            question: "What is the chemical symbol for potassium?",
            correctAnswer: "K",
            answerOptions: ["P", "K", "Pt", "Po"]
        ),
        Question(
            question: "What is the hardest natural substance on Earth?",
            correctAnswer: "Diamond",
            answerOptions: ["Gold", "Iron", "Diamond", "Platinum"]
        ),
        Question(
            question: "Which planet is known for its prominent ring system?",
            correctAnswer: "Saturn",
            answerOptions: ["Jupiter", "Uranus", "Saturn", "Neptune"]
        ),
        Question(
            question: "What is the SI unit of temperature?",
            correctAnswer: "Kelvin",
            answerOptions: ["Celsius", "Kelvin", "Fahrenheit", "Rankine"]
        ),
        Question(
            question: "Which animal is known as the King of the Jungle?",
            correctAnswer: "Lion",
            answerOptions: ["Tiger", "Elephant", "Lion", "Leopard"]
        ),
        Question(
            question: "What is the chemical symbol for gold?",
            correctAnswer: "Au",
            answerOptions: ["Ag", "Au", "Pb", "Pt"]
        ),
        Question(
            question: "What is the tallest mountain in the world?",
            correctAnswer: "Mount Everest",
            answerOptions: ["K2", "Mount Everest", "Kangchenjunga", "Makalu"]
        ),
        Question(
            question: "Which organ in the human body filters blood to produce urine?",
            correctAnswer: "Kidney",
            answerOptions: ["Liver", "Kidney", "Bladder", "Heart"]
        ),
        Question(
            question: "What is the term for molten rock beneath the Earth's surface?",
            correctAnswer: "Magma",
            answerOptions: ["Lava", "Magma", "Basalt", "Obsidian"]
        ),
        Question(
            question: "What is the main ingredient in bread?",
            correctAnswer: "Flour",
            answerOptions: ["Flour", "Sugar", "Yeast", "Salt"]
        ),
        Question(
            question: "Which planet is known as the Evening Star?",
            correctAnswer: "Venus",
            answerOptions: ["Venus", "Mars", "Mercury", "Jupiter"]
        ),
        Question(
            question: "Which scientist developed the periodic table of elements?",
            correctAnswer: "Dmitri Mendeleev",
            answerOptions: ["Dmitri Mendeleev", "Marie Curie", "Niels Bohr", "Antoine Lavoisier"]
        ),
        Question(
            question: "What is the primary language spoken in Brazil?",
            correctAnswer: "Portuguese",
            answerOptions: ["Spanish", "Portuguese", "French", "Italian"]
        ),
        Question(
            question: "What is the freezing point of water in Fahrenheit?",
            correctAnswer: "32°F",
            answerOptions: ["0°F", "32°F", "100°F", "212°F"]
        ),
        Question(
            question: "Which metal is liquid at room temperature?",
            correctAnswer: "Mercury",
            answerOptions: ["Gold", "Mercury", "Iron", "Copper"]
        ),
        Question(
            question: "Which ancient civilization built the pyramids?",
            correctAnswer: "Egyptians",
            answerOptions: ["Romans", "Egyptians", "Greeks", "Babylonians"]
        ),
        Question(
            question: "What is the primary source of energy for Earth's climate?",
            correctAnswer: "The Sun",
            answerOptions: ["The Moon", "Volcanoes", "The Sun", "Ocean Currents"]
        ),
        Question(
            question: "Which gas is commonly known as laughing gas?",
            correctAnswer: "Nitrous Oxide",
            answerOptions: ["Carbon Dioxide", "Nitrous Oxide", "Helium", "Oxygen"]
        ),
        Question(
            question: "Who is the author of 'Pride and Prejudice'?",
            correctAnswer: "Jane Austen",
            answerOptions: ["Charlotte Brontë", "Jane Austen", "Mary Shelley", "Emily Brontë"]
        ),
        Question(
            question: "Which country is known as the Land of the Rising Sun?",
            correctAnswer: "Japan",
            answerOptions: ["China", "Japan", "South Korea", "Thailand"]
        ),
        Question(
            question: "What is the currency of the United Kingdom?",
            correctAnswer: "Pound Sterling",
            answerOptions: ["Euro", "Pound Sterling", "Dollar", "Franc"]
        ),
        Question(
            question: "What is the process by which a caterpillar becomes a butterfly?",
            correctAnswer: "Metamorphosis",
            answerOptions: ["Transformation", "Metamorphosis", "Evolution", "Fertilization"]
        ),
        Question(
            question: "Which planet has the strongest gravitational pull in the Solar System?",
            correctAnswer: "Jupiter",
            answerOptions: ["Earth", "Jupiter", "Neptune", "Saturn"]
        ),
        Question(
            question: "What is the most common blood type in humans?",
            correctAnswer: "O+",
            answerOptions: ["A+", "O+", "B+", "AB+"]
        ),
        Question(
            question: "Which is the only planet that rotates on its side?",
            correctAnswer: "Uranus",
            answerOptions: ["Venus", "Neptune", "Uranus", "Saturn"]
        ),
        Question(
            question: "Which element is used in pencils?",
            correctAnswer: "Graphite",
            answerOptions: ["Lead", "Graphite", "Carbon", "Zinc"]
        ),
        Question(
            question: "What is the capital city of Canada?",
            correctAnswer: "Ottawa",
            answerOptions: ["Toronto", "Vancouver", "Ottawa", "Montreal"]
        ),
        Question(
            question: "Which planet is the densest in the Solar System?",
            correctAnswer: "Earth",
            answerOptions: ["Mars", "Jupiter", "Earth", "Venus"]
        ),
        Question(
            question: "Who discovered the law of gravity?",
            correctAnswer: "Isaac Newton",
            answerOptions: ["Albert Einstein", "Isaac Newton", "Galileo Galilei", "Nikola Tesla"]
        ),
        Question(
            question: "Which organelle contains the genetic material of a cell?",
            correctAnswer: "Nucleus",
            answerOptions: ["Mitochondria", "Nucleus", "Ribosome", "Golgi Apparatus"]
        ),
        Question(
            question: "What is the name of the largest internal organ in the human body?",
            correctAnswer: "Liver",
            answerOptions: ["Heart", "Liver", "Stomach", "Lungs"]
        ),
        Question(
            question: "What is the name of the galaxy that contains our Solar System?",
            correctAnswer: "Milky Way",
            answerOptions: ["Andromeda", "Milky Way", "Sombrero", "Triangulum"]
        )
    ]
}
