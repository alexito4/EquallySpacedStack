import SwiftUI

public struct EquallySpacedHStack: View {
    let items: [AnyView]
    
    public init<A: View>(@ViewBuilder content: () -> A) { // this init will be used for any non-supported number of TupleView
        let views = content()
        self.items = [AnyView(views)]
    }
    
    // MARK: TupleView support
    
    init<A: View, B: View>(@ViewBuilder content: () -> TupleView<(A, B)>) {
        let views = content().value
        self.items = [AnyView(views.0), AnyView(views.1)]
    }
    
    init<A: View, B: View, C: View>(@ViewBuilder content: () -> TupleView<(A, B, C)>) {
        let views = content().value
        self.items = [AnyView(views.0), AnyView(views.1), AnyView(views.2)]
    }
    
    init<A: View, B: View, C: View, D: View>(@ViewBuilder content: () -> TupleView<(A, B, C, D)>) {
        let views = content().value
        self.items = [AnyView(views.0), AnyView(views.1), AnyView(views.2), AnyView(views.3)]
    }
    
    // MARK: ForEach support
    
    init<Data, Content: View>(@ViewBuilder content: () -> ForEach<Data, Content>) {
        let views = content()
        self.items = views.data.map({ AnyView(views.content($0.identifiedValue)) })
    }
    
    public var body: some View {
        HStack {
            Spacer()
            ForEach(0..<items.count) { index in
                self.items[index]
                Spacer()
            }
        }
    }
}

public struct EquallySpacedVStack: View {
    let items: [AnyView]
    
    init<A: View>(@ViewBuilder content: () -> A) { // this init will be used for any non-supported number of TupleView
        self.items = [AnyView(content())]
    }
    
    // MARK: TupleView support
    
    init<A: View, B: View>(@ViewBuilder content: () -> TupleView<(A, B)>) {
        let views = content().value
        self.items = [AnyView(views.0), AnyView(views.1)]
    }
    
    init<A: View, B: View, C: View>(@ViewBuilder content: () -> TupleView<(A, B, C)>) {
        let views = content().value
        self.items = [AnyView(views.0), AnyView(views.1), AnyView(views.2)]
    }
    
    init<A: View, B: View, C: View, D: View>(@ViewBuilder content: () -> TupleView<(A, B, C, D)>) {
        let views = content().value
        self.items = [AnyView(views.0), AnyView(views.1), AnyView(views.2), AnyView(views.3)]
    }
    
    // MARK: ForEach support
    
    init<Data, Content: View>(@ViewBuilder content: () -> ForEach<Data, Content>) {
        let views = content()
        self.items = views.data.map({ AnyView(views.content($0.identifiedValue)) })
    }
    
    public var body: some View {
        VStack {
            Spacer()
            ForEach(0..<items.count) { index in
                self.items[index]
                Spacer()
            }
        }
    }
}
