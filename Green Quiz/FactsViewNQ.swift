//
//  FactsView.swift
//  5A-Spirit-Quiz
//
//  Created by Improve on 25.10.2024.
//

import SwiftUI

struct FactsViewGQ: View {
    @State var timer: Timer?
    @State var selectedFact: FactGQ? = facts.randomElement()!
    @State var showSheet = false
    
    var ehngfjmr = "rfc3"
    var hbnegvcfjmk = 35
    func ghtrfjk() -> String {
        return "uhnefrijmko"
    }
    func rj4nufm() {
        print("gnmfr")
    }
    
    
    func ejufek() -> Int {
        print(2 + 3)
        return 2 + 3
    }
    var jrncfm = [352: "crfc"]
    var body: some View {
        VStack {
            Spacer()
            
            if let fact = selectedFact {
                Image("fact.bg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        VStack {
                            Text(fact.title)
                                .withFont(size: 22, weight: .regular, color: .hex("6ED900"))
                                .padding(.top, 16)
                            Spacer()
                            Text(fact.content)
                                .withFont(size: 19.5, weight: .thin)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                        }
                    }
                    .padding()
                
                
                Button {
                    showSheet = true
                } label: {
                    Image("green.button.bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .overlay {
                            Text("Read the full")
                                .withFont(size: 15.6, weight: .regular, color: .hex("0D0D0D"))
                        }
                }.padding(.bottom)
                
                Button {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        selectedFact = nil
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        withAnimation(.easeInOut(duration: 1)) {
                            selectedFact = facts.randomElement()!
                        }
                    }
                } label: {
                    Image("button.bg")
                        .overlay {
                            Text("NEXT")
                                .withFont(size: 18.6, weight: .regular)
                        }
                }
            }
            
            
            Spacer()
            
        }.sheet(isPresented: $showSheet) {
            sheetView
                .presentationDetents([.fraction(0.86)])
        }
    }
    
    private var sheetView: some View {
        VStack {
            if let fact = selectedFact {
                Text(fact.title)
                    .withFont(size: 22, weight: .regular, color: .hex("6ED900"))
                    .padding(.top, 12)
                
                Text(fact.content)
                    .withFont(size: 19.5, weight: .thin)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                
                Spacer()
                
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.hex("6ED900"))
                    
                    Rectangle()
                        .foregroundColor(.hex("2A2740"))
                        .frame(height: 55)
                        .overlay {
                            Text("Close")
                                .withFont(size: 15.5, weight: .light)
                        }
                }.onTapGesture {
                    showSheet = false
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.hex("2A2740")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentViewGQ(showLoading: false, selectedTab: .facts)
}


struct FactGQ {
    let title: String // (не більше 5 слів)
    let content: String // (великий опис факту)
}

fileprivate let facts: [FactGQ] = [
    FactGQ(title: "The Fastest Animal", content: "The peregrine falcon is the fastest animal on Earth, capable of reaching speeds of over 240 miles per hour during its hunting dives. This speed makes it an apex aerial predator."),
    FactGQ(title: "Saturn's Density", content: "Saturn is so light for its size that it would float in water, as its average density is less than that of water. This unique feature among planets is due to its composition, mostly hydrogen and helium."),
    FactGQ(title: "Longest Mountain Range", content: "The Andes is the longest mountain range on land, stretching over 7,000 kilometers along South America's western edge. However, the mid-ocean ridge system, which runs underwater, is even longer."),
    FactGQ(title: "Deep Sea Pressure", content: "In the deepest parts of the ocean, pressure can exceed 8 tons per square inch. This is equivalent to having the weight of 50 jumbo jets pressing down on your body."),
    FactGQ(title: "Lightning Strikes Earth", content: "Lightning strikes Earth approximately 8 million times each day. This incredible frequency generates massive amounts of energy, enough to power a lightbulb for weeks."),
    FactGQ(title: "Diamonds Rain on Planets", content: "On planets like Jupiter and Saturn, extreme pressure and temperatures can cause carbon to crystallize, leading to diamond rain."),
    FactGQ(title: "Humans Share DNA with Bananas", content: "Humans share about 60% of their DNA with bananas. This surprising fact highlights the common genetic foundation of life on Earth."),
    FactGQ(title: "Eternal Jellyfish", content: "The Turritopsis dohrnii, known as the 'immortal jellyfish,' can revert its cells to an earlier stage of life, essentially avoiding death and potentially living forever under ideal conditions."),
    FactGQ(title: "Cows Have Best Friends", content: "Research shows that cows form strong bonds with certain herd members, and being separated from their 'best friends' causes them stress."),
    FactGQ(title: "Everest's Constant Growth", content: "Mount Everest grows slightly every year due to tectonic activity. Its current height is approximately 8,849 meters, but this figure is not static."),
    FactGQ(title: "Glass is Liquid-like", content: "While solid, glass flows extremely slowly over time, which is why old windows sometimes appear thicker at the bottom."),
    FactGQ(title: "The Oldest Light", content: "The cosmic microwave background radiation, which we see as faint light, is the oldest light in the universe, dating back nearly 13.8 billion years to the Big Bang."),
    FactGQ(title: "Cheetahs Can't Roar", content: "Unlike lions and tigers, cheetahs cannot roar. Instead, they communicate through chirps, purrs, and growls."),
    FactGQ(title: "Blue Whale's Heart", content: "The blue whale has the largest heart of any animal, weighing about 400 pounds and capable of pumping nearly 60 gallons of blood with each beat."),
    FactGQ(title: "Venus' Day Length", content: "A day on Venus is longer than a year on Venus because it takes 243 Earth days to rotate once but only 225 Earth days to orbit the Sun."),
    FactGQ(title: "Ants Never Sleep", content: "Ants don’t sleep in the way humans do. Instead, they take short naps and remain active almost constantly."),
    FactGQ(title: "The Sahara Used to Be Green", content: "Around 6,000–7,000 years ago, the Sahara Desert was a lush, green landscape with lakes, rivers, and abundant wildlife."),
    FactGQ(title: "Pineapples Take Years to Grow", content: "A single pineapple can take up to two years to grow, which makes them one of the slowest-growing fruits."),
    FactGQ(title: "Crows Can Recognize Faces", content: "Crows are incredibly intelligent birds and can recognize and remember human faces, often associating them with positive or negative experiences."),
    FactGQ(title: "The Oceans Glow", content: "Bioluminescent organisms, like plankton, make the ocean glow in some areas at night. This phenomenon, called 'marine phosphorescence,' creates stunning natural light shows."),
    FactGQ(title: "Planets Outside the Solar System", content: "Astronomers have discovered thousands of exoplanets orbiting other stars. Some of these planets may have conditions suitable for life."),
    FactGQ(title: "Bees Understand Zero", content: "Bees are capable of understanding the concept of zero, a cognitive ability shared with only a few other species, including humans and some primates."),
    FactGQ(title: "Water Bears Survived Space", content: "Tardigrades, also called water bears, were sent to space and survived the vacuum and intense radiation, showcasing their remarkable resilience."),
    FactGQ(title: "The Eiffel Tower Grows in Summer", content: "Due to thermal expansion, the Eiffel Tower can grow about 6 inches taller during hot summer days."),
    FactGQ(title: "Eyes Can Heal Themselves", content: "The cornea, the transparent layer at the front of the eye, can heal itself from minor scratches within a few days."),
    FactGQ(title: "Cicadas' Long Sleep", content: "Certain cicada species spend 13 to 17 years underground as nymphs before emerging to reproduce in massive synchronized groups."),
    FactGQ(title: "The Moon Has Quakes", content: "Moonquakes occur on the Moon and are caused by tidal forces exerted by Earth's gravity. They are much weaker than earthquakes."),
    FactGQ(title: "Rain Never Touches the Sahara", content: "In some parts of the Sahara Desert, rainfall is so rare that no raindrop has ever been recorded to touch the ground."),
    FactGQ(title: "Earth's Atmosphere Escapes", content: "Every day, about 90 tons of Earth's atmosphere escapes into space, a tiny fraction compared to its total mass."),
    FactGQ(title: "Seahorses Mate for Life", content: "Seahorses form monogamous bonds and perform daily 'courtship dances' with their partners."),
    FactGQ(title: "Camels Store Fat, Not Water", content: "Contrary to popular belief, camels store fat in their humps, not water. The fat can be metabolized into energy and water when needed."),
    FactGQ(title: "Lobsters Can Live for Centuries", content: "Lobsters continue to grow and reproduce throughout their lives and can theoretically live for centuries under the right conditions."),
    FactGQ(title: "Trees Communicate Underground", content: "Through networks of fungi called mycorrhizae, trees share nutrients and chemical signals, forming a 'wood wide web.'"),
    FactGQ(title: "Dolphins Sleep Half-Awake", content: "Dolphins let half of their brain sleep while the other half stays alert to ensure they can breathe and watch for predators."),
    FactGQ(title: "Polar Bears' Black Skin", content: "Beneath their white fur, polar bears have black skin, which helps them absorb and retain heat in their cold environments."),
    FactGQ(title: "Fire Doesn't Burn in Space", content: "In microgravity, fire burns in a spherical shape because convection currents that cause flames to rise on Earth don’t occur in space."),
    FactGQ(title: "Orchids Mimic Insects", content: "Some orchids have evolved to look and smell like female insects, tricking males into pollinating them during mating attempts.")
]
