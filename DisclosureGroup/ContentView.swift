//
//  ContentView.swift
//  DisclosureGroup
//
//  Created by ramil on 12.08.2020.
//

import SwiftUI

struct Item: Identifiable {
    var id: String { UUID().uuidString }
    let name, image: String
}

extension Item {
    static var desktop = [
        Item(name: "iMac", image: "desktopcomputer"),
        Item(name: "Mac Pro Gen 1", image: "macpro.gen1"),
        Item(name: "Mac Pro Gen 2", image: "macpro.gen2"),
        Item(name: "Mac Pro Gen 3", image: "macpro.gen3"),
        Item(name: "Mac Mini", image: "macmini")
    ]
    static var laptops = [
        Item(name: "MacBook Pro", image: "laptopcomputer"),
        Item(name: "MacBook Air", image: "laptopcomputer")
    ]
    static var iphones = [
        Item(name: "iPhone SE (2nd) gen", image: "iphone.homebutton"),
        Item(name: "iPhone 11", image: "iphone")
    ]
    static var ipads = [
        Item(name: "iPad Air", image: "ipad.homebutton"),
        Item(name: "iPAd Pro", image: "ipad")
    ]
    static var earpods = [
        Item(name: "EarPods", image: "earpods"),
        Item(name: "AirPods", image: "airpods"),
        Item(name: "AirPods Pro", image: "airpodspro")
    ]
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Label("Desktop", systemImage: "applelogo")) {
                    DisclosureView(mainTitle: "Desktop", mainImage: "display.2", items: Item.desktop)
                }
                Section(header: Label("Laptops", systemImage: "applelogo")) {
                    DisclosureView(mainTitle: "Laptops", mainImage: "laptopcomputer", items: Item.laptops)
                }
                Section(header: Label("iPhone", systemImage: "applelogo")) {
                    DisclosureView(mainTitle: "iPhone", mainImage: "apps.iphone", items: Item.iphones)
                    DisclosureView(mainTitle: "iPad", mainImage: "apps.ipad", items: Item.ipads)
                    DisclosureView(mainTitle: "EarPods", mainImage: "headphones.circle", items: Item.earpods)
                }
            }.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DisclosureView: View {
    var mainTitle: String
    var mainImage: String
    var items: [Item]
    
    var body: some View {
        DisclosureGroup(
            content: {
                ForEach(items) { item in
                    NavigationLink(
                        destination: DetailView(item: item),
                        label: {
                            Label(item.name, systemImage: item.image)
                        }
                    )
                }.font(.system(size: 17, weight: .light, design: .rounded))
            },
            label: {
                Label(mainTitle, systemImage: mainImage)
                    .font(.system(size: 22, weight: .regular, design: .rounded))
            }
        ).font(.headline)
    }
}

struct DetailView: View {
    var item: Item
    var body: some View {
        VStack {
            Image(systemName: item.image)
                .font(.system(size: 220, weight: .ultraLight, design: .default))
                .padding()
            Text(item.name)
                .font(.title)
        }
    }
}
