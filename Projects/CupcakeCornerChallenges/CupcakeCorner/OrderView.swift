//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Joe on 02/04/2022.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.data.type) {
                        ForEach(OrderData.types.indices) {
                            Text(OrderData.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.data.quantity)", value: $order.data.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special Requests?", isOn: $order.data.specialRequestEnabled.animation())
                    
                    if order.data.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.data.extraFrosting)
                        Toggle("Add sprinkles", isOn: $order.data.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
