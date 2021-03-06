//
//  ViewProxy.swift
//  UILayoutBuilder
//
//  Created by marty-suzuki on 2020/02/05.
//

public struct ViewProxy {

    private let view: ULBView
    private let context: Context

    init(view: ULBView, context: Context) {
        self.view = view
        self.context = context
    }
}

extension ViewProxy: LayoutRepresentable {
    public var leading      : LayoutXAxis      { .init(view, for: \.leadingAnchor, context: context) }
    public var trailing     : LayoutXAxis      { .init(view, for: \.trailingAnchor, context: context) }
    public var left         : LayoutXAxis      { .init(view, for: \.leftAnchor, context: context) }
    public var right        : LayoutXAxis      { .init(view, for: \.rightAnchor, context: context) }
    public var top          : LayoutYAxis      { .init(view, for: \.topAnchor, context: context) }
    public var bottom       : LayoutYAxis      { .init(view, for: \.bottomAnchor, context: context) }
    public var width        : LayoutDimension  { .init(view, for: \.widthAnchor, context: context) }
    public var height       : LayoutDimension  { .init(view, for: \.heightAnchor, context: context) }
    public var centerX      : LayoutXAxis      { .init(view, for: \.centerXAnchor, context: context) }
    public var centerY      : LayoutYAxis      { .init(view, for: \.centerYAnchor, context: context) }
    public var firstBaseline: LayoutYAxis      { .init(view, for: \.firstBaselineAnchor, context: context) }
    public var lastBaseline : LayoutYAxis      { .init(view, for: \.lastBaselineAnchor, context: context) }

    public var edges        : LayoutEdges      { .init(top: top, leading: leading, bottom: bottom, trailing: trailing) }
    public var size         : LayoutSize       { .init(width: width, height: height) }
    public var center       : LayoutCenter     { .init(axis1: centerX, axis2: centerY) }
    public var horizontal   : LayoutHorizontal { .init(axis1: leading, axis2: trailing) }
    public var vertical     : LayoutVertical   { .init(axis1: top,     axis2: bottom) }
}

#if os(iOS) || os(tvOS)
extension ViewProxy {

    @available(iOS 11, tvOS 11, macCatalyst 13, *)
    public var safeAreaLayoutGuide: LayoutGuideProxy {
        .init(layoutGuide: view.safeAreaLayoutGuide, context: context)
    }

    public var layoutMarginsGuide: LayoutGuideProxy {
        .init(layoutGuide: view.layoutMarginsGuide, context: context)
    }
}
#endif

extension ViewProxy {

    public struct AddSubview {
        fileprivate let view: ULBView
        fileprivate let context: Context
    }

    public var add: AddSubview { .init(view: view, context: context) }
}

extension ViewProxy.AddSubview {

    public func subview(_ subview: ULBView, handler: (ViewProxy) -> Void = { _ in }) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        view._add(subview: subview)
        handler(ViewProxy(view: subview, context: context))
    }

    public func subview(
        _ subview1: ULBView,
        _ subview2: ULBView,
        handler: (
        ViewProxy,
        ViewProxy
        ) -> Void = { _, _ in }
    ) {
        [subview1, subview2].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view._add(subview: $0)
        }
        handler(
            ViewProxy(view: subview1, context: context),
            ViewProxy(view: subview2, context: context)
        )
    }

    public func subview(
        _ subview1: ULBView,
        _ subview2: ULBView,
        _ subview3: ULBView,
        handler: (
        ViewProxy,
        ViewProxy,
        ViewProxy
        ) -> Void = { _, _, _ in }
    ) {
        [subview1, subview2, subview3].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view._add(subview: $0)
        }
        handler(
            ViewProxy(view: subview1, context: context),
            ViewProxy(view: subview2, context: context),
            ViewProxy(view: subview3, context: context)
        )
    }

    public func subview(
        _ subview1: ULBView,
        _ subview2: ULBView,
        _ subview3: ULBView,
        _ subview4: ULBView,
        handler: (
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy
        ) -> Void  = { _, _, _, _ in }
    ) {
        [subview1, subview2, subview3, subview4].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view._add(subview: $0)
        }
        handler(
            ViewProxy(view: subview1, context: context),
            ViewProxy(view: subview2, context: context),
            ViewProxy(view: subview3, context: context),
            ViewProxy(view: subview4, context: context)
        )
    }

    public func subview(
        _ subview1: ULBView,
        _ subview2: ULBView,
        _ subview3: ULBView,
        _ subview4: ULBView,
        _ subview5: ULBView,
        handler: (
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy
        ) -> Void = { _, _, _, _, _ in }
    ) {
        [subview1, subview2, subview3, subview4, subview5].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view._add(subview: $0)
        }
        handler(
            ViewProxy(view: subview1, context: context),
            ViewProxy(view: subview2, context: context),
            ViewProxy(view: subview3, context: context),
            ViewProxy(view: subview4, context: context),
            ViewProxy(view: subview5, context: context)
        )
    }

    public func subview(
        _ subview1: ULBView,
        _ subview2: ULBView,
        _ subview3: ULBView,
        _ subview4: ULBView,
        _ subview5: ULBView,
        _ subview6: ULBView,
        handler: (
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy
        ) -> Void = { _, _, _, _, _, _ in }
    ) {
        [subview1, subview2, subview3, subview4, subview5, subview6].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view._add(subview: $0)
        }
        handler(
            ViewProxy(view: subview1, context: context),
            ViewProxy(view: subview2, context: context),
            ViewProxy(view: subview3, context: context),
            ViewProxy(view: subview4, context: context),
            ViewProxy(view: subview5, context: context),
            ViewProxy(view: subview6, context: context)
        )
    }

    public func subview(
        _ subview1: ULBView,
        _ subview2: ULBView,
        _ subview3: ULBView,
        _ subview4: ULBView,
        _ subview5: ULBView,
        _ subview6: ULBView,
        _ subview7: ULBView,
        handler: (
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy
        ) -> Void = { _, _, _, _, _, _, _ in }
    ) {
        [subview1, subview2, subview3, subview4, subview5, subview6, subview7].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view._add(subview: $0)
        }
        handler(
            ViewProxy(view: subview1, context: context),
            ViewProxy(view: subview2, context: context),
            ViewProxy(view: subview3, context: context),
            ViewProxy(view: subview4, context: context),
            ViewProxy(view: subview5, context: context),
            ViewProxy(view: subview6, context: context),
            ViewProxy(view: subview7, context: context)
        )
    }

    public func subview(
        _ subview1: ULBView,
        _ subview2: ULBView,
        _ subview3: ULBView,
        _ subview4: ULBView,
        _ subview5: ULBView,
        _ subview6: ULBView,
        _ subview7: ULBView,
        _ subview8: ULBView,
        handler: (
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy
        ) -> Void = { _, _, _, _, _, _, _, _ in }
    ) {
        [subview1, subview2, subview3, subview4, subview5, subview6, subview7, subview8].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view._add(subview: $0)
        }
        handler(
            ViewProxy(view: subview1, context: context),
            ViewProxy(view: subview2, context: context),
            ViewProxy(view: subview3, context: context),
            ViewProxy(view: subview4, context: context),
            ViewProxy(view: subview5, context: context),
            ViewProxy(view: subview6, context: context),
            ViewProxy(view: subview7, context: context),
            ViewProxy(view: subview8, context: context)
        )
    }

    public func subview(
        _ subview1: ULBView,
        _ subview2: ULBView,
        _ subview3: ULBView,
        _ subview4: ULBView,
        _ subview5: ULBView,
        _ subview6: ULBView,
        _ subview7: ULBView,
        _ subview8: ULBView,
        _ subview9: ULBView,
        handler: (
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy
        ) -> Void = { _, _, _, _, _, _, _, _, _ in }) {
        [subview1, subview2, subview3, subview4, subview5, subview6, subview7, subview8, subview9].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view._add(subview: $0)
        }
        handler(
            ViewProxy(view: subview1, context: context),
            ViewProxy(view: subview2, context: context),
            ViewProxy(view: subview3, context: context),
            ViewProxy(view: subview4, context: context),
            ViewProxy(view: subview5, context: context),
            ViewProxy(view: subview6, context: context),
            ViewProxy(view: subview7, context: context),
            ViewProxy(view: subview8, context: context),
            ViewProxy(view: subview9, context: context)
        )
    }

    public func subview(
        _ subview1: ULBView,
        _ subview2: ULBView,
        _ subview3: ULBView,
        _ subview4: ULBView,
        _ subview5: ULBView,
        _ subview6: ULBView,
        _ subview7: ULBView,
        _ subview8: ULBView,
        _ subview9: ULBView,
        _ subview10: ULBView,
        handler: (
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy,
        ViewProxy
        ) -> Void = { _, _, _, _, _, _, _, _, _, _ in }) {
        [subview1, subview2, subview3, subview4, subview5, subview6, subview7, subview8, subview9, subview10].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view._add(subview: $0)
        }
        handler(
            ViewProxy(view: subview1, context: context),
            ViewProxy(view: subview2, context: context),
            ViewProxy(view: subview3, context: context),
            ViewProxy(view: subview4, context: context),
            ViewProxy(view: subview5, context: context),
            ViewProxy(view: subview6, context: context),
            ViewProxy(view: subview7, context: context),
            ViewProxy(view: subview8, context: context),
            ViewProxy(view: subview9, context: context),
            ViewProxy(view: subview10, context: context)
        )
    }
}
