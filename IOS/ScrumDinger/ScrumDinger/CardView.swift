//
//  CardView.swift
//  scrumDinger
//
//  Created by Omar on 04/10/2022.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack (alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
                .padding(.bottom, 10)
//            Spacer()
//                .frame(minHeight: 10, idealHeight: 20, maxHeight: 100)
//                .fixedSize()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
            }
            .font(.caption)
            
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
        static var previews: some View {
            CardView(scrum: scrum)
                .background(scrum.theme.mainColor)
                .previewLayout(.fixed(width: 400, height: 60))
        }
}
