import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    let tabItems: [TabItem]
    
    var body: some View {
        HStack {
            ForEach(tabItems.indices, id: \.self) { index in
                Spacer()
                
                Button(action: {
                    withAnimation {
                        selectedTab = index
                    }
                }) {
                    VStack {
                        if selectedTab == index {
                            tabItems[index].animatedIcon // Animated icon when selected
                                .frame(width: 30, height: 30)
                        } else {
                            tabItems[index].staticIcon // Static icon when unselected
                                .frame(width: 25, height: 25)
                                .foregroundColor(.gray)
                        }
                        Text(tabItems[index].title)
                            .font(.caption)
                            .foregroundColor(selectedTab == index ? .black : .gray)
                    }
                }
                
                Spacer()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}
