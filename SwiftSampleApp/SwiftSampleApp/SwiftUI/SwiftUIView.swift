//
//  SwiftUIView.swift
//  SwiftSampleApp
//
//  Created by Allen on 9/27/23.
//

import SwiftUI

struct SwiftUIView: View {
    weak var navigationController: UINavigationController?
    var buffer: CGFloat = 42
    var body: some View {
//        Text("Hello, World!")
        VStack {
            HStack {
                Text("SwiftUI Test")
                    .bold()
                    .font(.system(.body))
            }.background(Color.red)
                .padding()

            Spacer()
                .frame(width: 1, height: 20, alignment: .bottom)
            VStack(alignment: .center) {
                Button(action: {
                    print("Navigate to UIKit")
                    navigationController?.popViewController(animated: true)
                }) {
                    Text("Navigate to UIKit")
                        .font(.system(size: 21))
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 2 * buffer,
                               height: 42,
                               alignment: .center)

                }
            }.background(Color.blue)
            .cornerRadius(21)
            .padding()

            Spacer()
                .frame(width: 2,
                       height: 20,
                       alignment: .bottom)
            ZStack(alignment: .top){
                Image("fitbit")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Button(action: {

                }) {
                    Text("Test Position")
                        .font(.system(size: 21))
                        .bold()
                        .padding(20)
                }.background(.clear)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }.background(.yellow)
                .frame(width: UIScreen.main.bounds.width,
                       alignment: .center)
                .cornerRadius(16)


//            VStack {
//                ForEach((1...3), id: \.self) { i in
//                    Text("\(i)")
//                }
//            }
        }
        .navigationBarHidden(true)
        .background(Color.gray)
        .cornerRadius(21)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
