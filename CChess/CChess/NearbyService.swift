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
    
    private let myPeerID = MCPeerID(displayName: UIDevice.current.name)
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    private var nearbyServiceBrowser: MCNearbyServiceBrowser?
    
    private var invitedPeers = Set<MCPeerID>()
    
    lazy var session: MCSession = {
        let session = MCSession(peer: myPeerID,
                                securityIdentity: nil,
                                encryptionPreference: .required)
        session.delegate = self
        return session
    }()
    
    convenience init(serviceType: String) {
        self.init()
    }
    
    deinit {
        nearbyServiceAdvertiser?.stopAdvertisingPeer()
        nearbyServiceBrowser?.stopBrowsingForPeers()
    }
    
    func initService(serviceType: String) {
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: nil, serviceType: serviceType)
        nearbyServiceBrowser = MCNearbyServiceBrowser(peer: myPeerID, serviceType: serviceType)
        
        nearbyServiceAdvertiser?.delegate = self
        nearbyServiceAdvertiser?.startAdvertisingPeer()
        print("\(myPeerID.displayName) started advertsing peer...")
        
        nearbyServiceBrowser?.delegate = self
        nearbyServiceBrowser?.startBrowsingForPeers()
        print("\(myPeerID.displayName) started browsing for peers...")
    }
    
    func send(msg: String) {
        
        guard !session.connectedPeers.isEmpty else {
            return
        }
        
        if let data = msg.data(using: .utf8), session.connectedPeers.count > 0 {
            try? session.send(data,
                              toPeers: session.connectedPeers,
                              with: .reliable)
        }
    }
    
    func stopService() {
        session.disconnect()
        nearbyServiceAdvertiser?.stopAdvertisingPeer()
        nearbyServiceBrowser?.stopBrowsingForPeers()
    }
}

extension NearbyService: MCSessionDelegate {
    
    func session(_ session: MCSession,
                 peer peerID: MCPeerID,
                 didChange state: MCSessionState) {
        
        switch state {
            
        case .connecting:
            print("connecting: \(peerID.displayName)")
            
        case .connected:
            print("connected: \(peerID.displayName)")
            
            nearbyServiceAdvertiser?.stopAdvertisingPeer()
            nearbyServiceBrowser?.stopBrowsingForPeers()
            
            DispatchQueue.main.async {
                self.nearbyServiceDelegate?.connectedWith(peer: peerID.displayName)
            }
            
        case .notConnected:
            print("not connected: \(peerID.displayName)")
            
            invitedPeers.remove(peerID)
            
            DispatchQueue.main.async {
                self.nearbyServiceDelegate?.disconnectedFrom(peer: peerID.displayName)
            }
        @unknown default:
            print("unknown state: \(state)")
        }
    }
    
    func session(_ session: MCSession,
                 didReceive data: Data,
                 fromPeer peerID: MCPeerID) {
        
        print("did receive data: \(data)")
        
        if let msg = String(data: data, encoding: .utf8) {
            DispatchQueue.main.async {
                self.nearbyServiceDelegate?.didReceive(msg: msg)
            }
        }
    }
    
    func session(_ session: MCSession,
                 didReceive stream: InputStream,
                 withName streamName: String,
                 fromPeer peerID: MCPeerID) {
    }
    
    func session(_ session: MCSession,
                 didStartReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 with progress: Progress) {
    }
    
    func session(_ session: MCSession,
                 didFinishReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 at localURL: URL?,
                 withError error: Error?) {
    }
}

extension NearbyService: MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser,
                 foundPeer peerID: MCPeerID,
                 withDiscoveryInfo info: [String : String]?) {
        
        // Already connected
        if session.connectedPeers.contains(peerID) {
            return
        }

        // Already invited before
        if invitedPeers.contains(peerID) {
            return
        }
        
        invitedPeers.insert(peerID)
        
        // ONLY ONE SIDE INVITES
        if myPeerID.displayName + myPeerID.description
            < peerID.displayName + peerID.description {
            
            browser.invitePeer(peerID,
                               to: session,
                               withContext: nil,
                               timeout: 10)
            
            print("\(myPeerID.displayName) found and invited \(peerID.displayName)")
        }
    }
    
    func browser(_ browser: MCNearbyServiceBrowser,
                 lostPeer peerID: MCPeerID) {
        
        print("lost peer: \(peerID.displayName)")
    }
}

extension NearbyService: MCNearbyServiceAdvertiserDelegate {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                    didReceiveInvitationFromPeer peerID: MCPeerID,
                    withContext context: Data?,
                    invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
        invitationHandler(true, session)
        print("\(myPeerID.displayName) received invatation from \(peerID.displayName)")
    }
}
