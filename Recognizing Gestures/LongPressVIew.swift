import SwiftUI
struct LongPressView: View{
    @State var sizes: [
        CGSize(width:150, height: 80),
        CGSize(width:200, height: 40)
        CGSize(width: 50, height:250)
        CGSize(width: 220, height: 100)
        CGSize(width: 90, height: 90)
    ]
    var LongPressGesture: some Gesture{ 
        LongPressGesture()
        .onEnded{ value in
            withAnimation{
                sizeIndex += 1
                if sizeIndex == sizes.count{
                    sizeIndex = sizeIndex
                }
            }
        }
    }
    var body: some view{ 
        Vstack{
            Text("Touch and hold the capsule to change its size")
            Spacer()
            Capsule()
                .foregroundColor(.yellow)
                .frame(width: sizes[sizeIndex].width, height: sizes[sizeIndex].height)
                .gesture(LongPressGesture)
                Spacer()
        }
        navigationTitle("Touch and Hold")
        .padding()
        .toolbar{
            Button("Reset"){
                sizeIndex = 0 
            }
        }
    }

}
struct LongPressView_Previews: PreviewProvider{
    static var previews: some View{
        LongPressView() 
    }
}