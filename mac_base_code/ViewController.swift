//
//  ViewController.swift
//  mac_base_code
//
//  Created by Yapindo on 03/01/21.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var CollectionView: NSCollectionView!
    private var AppName = [String]()
    private var tmp: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.isSelectable = true
        
        AppName = ["Ilmu Penyakit Dalam"]
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        for item in indexPaths {
            if let int = item.last {
                self.tmp = String(AppName[int])
            }
        }
        collectionView.deselectItems(at: indexPaths)
        
        performSegue(withIdentifier: "WebSegue", sender: self)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let destinationController = segue.destinationController as? WebviewController {
            destinationController.AppTemp = self.tmp
        }
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSCollectionViewDelegate, NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppName.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "AppItem"), for: indexPath)
        
        item.imageView?.image = NSImage(named: String(AppName[indexPath.item]))
        
        return item
    }
}
