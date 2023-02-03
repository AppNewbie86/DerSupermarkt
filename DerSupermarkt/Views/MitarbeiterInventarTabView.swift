
import SwiftUI

struct MitarbeiterInventarTabView: View {
    
    
    @State var workers: [String] = ["MitarbeiterListe"]
    @State var newWorker: String = ""
    
    @State var inventar: [String] = ["InventarListe"]
    @State var newInventarProduct: String = ""

    
    
    // hinzufügen einer alertvariablen
    @State private var presentAlert: Bool = false
    @State private var isPushed: Bool = false
    @State private var isPresented: Bool = false
    @State private var isSaved : Bool = false
    
    @State private var showNextView = false
    
    
    var body: some View {
        NavigationView{
            TabView{
                
                VStack{
                    Image("mitarbeiterliste")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(15)
                    
                    HStack {
                        
                        TextField("new worker", text: $newWorker).foregroundColor(Color.white)
                            .background(Color(.lightGray))
                            .frame(width: 150, height: 60)
                        
                        Button(action: {
                            self.workers.append(self.newWorker)
                            self.newWorker = ""
                        }) {
                            Text("neuer Mitarbeiter")
                                .frame(width: 150, height: 40)
                                .foregroundColor(Color.white)
                                .background(Utils.color)
                                .cornerRadius(5)
                        }
                    }
                    
                    List{
                        Text("MitarbeiterListe")
                    }
                    .tag(0)
                }
                .padding(40)
                VStack{
                    Text("Inventar Liste")
                        .bold()
                        .font(.system(size: 33))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Utils.color)
                    
                    Image("potion")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(15)
                    
                    HStack {
                        
                        TextField("add here a new Product", text: $newInventarProduct).foregroundColor(Color.white)
                            .background(Color(.lightGray))
                        Button(action: {
                            self.inventar.append(self.newInventarProduct)
                            self.newInventarProduct = ""
                        }) {
                            Text("Product \n hinzufügen")
                                .frame(width: 150, height: 55)
                                .foregroundColor(Color.white)
                                .background(Utils.color)
                                .cornerRadius(10)
                        }
                    }
                    List {
                        Text("InventarListe")
                    }
                    
                    .tag(1)
                }
                .padding(40)
                VStack{
                    
                    Text("Unsere Top Artikel des Monats")
                        .bold()
                        .font(.system(size: 33))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Utils.color)
                    
                    
                    ZStack{
                        Image("card1")
                            .resizable()
                        Image("card2")
                            .resizable()
                            .position(x: 250, y:220)
                            .tag(2)
                            .padding(20)
                    }
                    HStack{
                        
                        Button(action: {
                            self.showNextView = true
                        }) {
                            Text("App Infos")
                            
                        }.padding()
                            .foregroundColor(Color.orange)
                            .font(.system(size: 14))
                        
                            .sheet(isPresented: $showNextView) {
                                HomeView()
                            }
                        
                            .foregroundColor(Color.black) // ändert SchriftFarbe
                            .padding() // macht einen Abstand vom Button zur
                        
                        
                        Button("Edit"){
                            isPresented = true
                        }.padding()
                            .foregroundColor(Color.orange)
                            .font(.system(size: 14))
                        
                        
                        
                    }
                    // Klappbarer View typisch IOS Layout
                    .sheet(isPresented: $isPresented){
                        EditView()
                    }
                    
                    
                    
                    
                }
                .padding(40)
            }.tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            
            
            // indexDisplayMode: .never
            
        }
    }
}
