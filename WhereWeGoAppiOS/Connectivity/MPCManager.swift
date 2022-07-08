//
//  MPCManager.swift
//  WhereWeGoAppiOS
//
//  Created by Stefano Leva on 05/07/22.
//

import Foundation
import MultipeerConnectivity

class MPCManager: NSObject {
    
    static let shared: MPCManager = MPCManager()
    
    private let peerID :MCPeerID = MCPeerID(displayName: UIDevice.current.name)
    
    private lazy var session: MCSession =
    MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)
    
    private lazy var browser: MCNearbyServiceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: "FestaMangia")
    
    weak var delegate: MPCManagerDelegate?
    
    private override init(){
        super.init()
        session.delegate = self
        browser.delegate = self
    }
    
    func send(message: Message) {
        if let data = message.toData() {
            try? session.send(data, toPeers: session.connectedPeers, with: .reliable)
            print(session.connectedPeers)
        }
    }
    
    func startService() {
        browser.startBrowsingForPeers()
    }
    
    func stopService() {
        browser.stopBrowsingForPeers()
    }
}

extension MPCManager: MCNearbyServiceBrowserDelegate{
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("A Peer is found \(peerID.displayName)")
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 10)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        
    }
    
}

extension MPCManager: MCSessionDelegate{
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        var stringState = " ";
        
        switch state{
        case .connected:
            stringState = "Connected"
        case .connecting:
            stringState = "Connecting"
        case .notConnected:
            stringState = "Not Connected"
        @unknown default:
            fatalError("State not recognized: \(state)")
        }
        
        print("\(peerID.displayName): \(stringState)")
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let message = Message.toMessage(from: data) {
            if let delegate = delegate {
                delegate.mpcManager(self, didReceive: message, from: peerID)
            }
        }
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
}

protocol MPCManagerDelegate: AnyObject{
    func mpcManager(_ manager: MPCManager, didReceive message: Message, from peer: MCPeerID)
    func mpcManager(_ manager: MPCManager, userIsConnected user: String)
}


