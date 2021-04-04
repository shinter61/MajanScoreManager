//
//  BannerAd.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/04/05.
//

import SwiftUI
import GoogleMobileAds

struct BannerAd: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}
