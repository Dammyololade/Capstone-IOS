//
//  DishListView.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 20.08.23.
//

import SwiftUI

struct DishListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    @State var selectedCategory = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("ORDER FOR DELIVERY")
                        .font(.headline)
                        .fontWeight(.bold)
                        .cornerRadius(16)
                        .padding(.bottom, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(values: ["Starters", "Mains", "Desserts", "Drinks"]) { category in
                                AppChip(selectedChip: $selectedCategory, title: category)
                                    .onTapGesture {
                                        selectedCategory = selectedCategory == category ? "" : category
                                    }
                            }
                            
        
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                
                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptors()
                ) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes) { dish in
                            HStack {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(dish.title ?? "")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 16)
                                    
                                    Text(dish.descriptionInfo ?? "")
                                        .lineLimit(2)
                                        .padding(.bottom, 16)
                                    Text(dish.formatPrice())
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(AppColors.primary)
                                }
                                .padding(.trailing, 8)
                                
                                
                                Spacer()
                                
                                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 75, height: 75)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                            }
                        }
                    
                    }
                    .listStyle(.plain)
                    .searchable(text: $searchText)
                }
            }
        }
            .task {
                await DishesModel().reload(viewContext)
            }
    }
    
    func buildPredicate() -> NSPredicate {
        if !searchText.isEmpty {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        } else if !selectedCategory.isEmpty {
            return NSPredicate(format: "category == %@", selectedCategory.lowercased())
        }
        
        return NSPredicate(value: true)
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "title",
                          ascending: true,
                          selector:
                            #selector(NSString .localizedStandardCompare)
            )
        ]
    }
}

#Preview {
    DishListView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
