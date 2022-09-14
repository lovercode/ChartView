import SwiftUI

struct LineShape: Shape {
    var data: [(Double, Double)]
    var lineStyle: LineStyle = .curved
    func path(in rect: CGRect) -> Path {
        var path = Path()
        switch lineStyle {
        case .curved:
            path = Path.quadCurvedPathWithPoints(data: data, in: rect)
        case .straight:
            path = Path.linePathWithPoints(data: data, in: rect)
        }
        return path
    }
}

struct LineShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineShape(data: [(0, 0), (0.25, 0.5), (0.5,0.8), (0.75, 0.6), (1, 1)])
                .stroke()
                .rotationEffect(.degrees(180), anchor: .center)
                                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))

            LineShape(data: [(0, -0.5), (0.25, 0.8), (0.5,-0.6), (0.75,0.6), (1, 1)], lineStyle: .straight)
                .stroke()
                .rotationEffect(.degrees(180), anchor: .center)
                                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
        }
    }
}
