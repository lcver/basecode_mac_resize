//
//  ViewController.swift
//  mac_base_code
//
//  Created by Yapindo on 03/01/21.
//

import Cocoa

class ViewController: NSViewController {
    
    private var AppName = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppName = ["Ilmu Penyakit Dalam"]
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSCollectionViewDelegate, NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "AppItem"), for: indexPath)
        
        item.imageView?.image = NSImage(named: String(AppName[0]))
        
        return item
    }
}
