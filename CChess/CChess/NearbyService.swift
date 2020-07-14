//
//  NearbyService.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-06-28.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class NearbyService: NSObject {
    var nearbyServiceDelegate: NearbyServiceDelegate?
    
    private let peerID = MCPeerID(displayName: UIDevice.current.name)
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    private var nearbyServiceBrowser: MCNearbyServiceBrowser?
    
    lazy var session: MCSession = {
        let session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        return session
    }()
    
    convenience init(serviceType: String) {
        self.init()
        initService(serviceType: serviceType)
    }
    
    deinit {
        nearbyServiceAdvertiser?.stopAdvertisingPeer()
        nearbyServiceBrowser?.stopBrowsingForPeers()
    }
    
    func initService(serviceType: String) {
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        nearbyServiceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        
        nearbyServiceAdvertiser?.delegate = self
        nearbyServiceAdvertiser?.startAdvertisingPeer()
        print("\(peerID.displayName) started advertsing peer...")
        
        nearbyServiceBrowser?.delegate = self
        nearbyServiceBrowser?.startBrowsingForPeers()
        print("\(peerID.displayName) started browsing for peers...")
    }
    
    func send(msg: String) {
        if let data = msg.data(using: .utf8), session.connectedPeers.count > 0 {
            try? session.send(data, toPeers: session.connectedPeers, with: .reliable)
        }
    }
}

extension NearbyService: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connecting:
            print("connecting: \(peerID.displayName)")
        case .connected:
            print("connected: \(peerID.displayName)")
            DispatchQueue.main.async {
                self.nearbyServiceDelegate?.connectedWith(peer: peerID.displayName)
            }
        case .notConnected:
            print("not connected: \(peerID.displayName)")
            DispatchQueue.main.async {
                self.nearbyServiceDelegate?.disconnectedFrom(peer: peerID.displayName)
            }
        @unknown default:
            print("unknown state: \(state)")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("did receive data: \(data)")
        if let msg = String(data: data, encoding: .utf8) {
            DispatchQueue.main.async {
                self.nearbyServiceDelegate?.didReceive(msg: msg)
            }
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
    }
}

extension NearbyService: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 60)
        print("\(self.peerID.displayName) found and invited \(peerID.displayName)")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("lost peer: \(peerID.displayName)")
    }
}

extension NearbyService: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
        print("\(self.peerID.displayName) received invatation from \(peerID.displayName)")
    }
}
