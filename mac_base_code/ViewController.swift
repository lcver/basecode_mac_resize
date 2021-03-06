//
//  ViewController.swift
//  mac_base_code
//
//  Created by Yapindo on 03/01/21.
//

import Cocoa

// Change this name app
public let AppName = "UKMPPD"

class ViewController: NSViewController {
    
    // Attribute
    private var AppList = [String]()
    private var tmp: String!
    
    @IBOutlet weak var CollectionView: NSCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.isSelectable = true
        
        AppList = ["Ilmu Penyakit Dalam"]
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        // Set window Title
        let NameKey = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        self.view.window?.title = "\(AppName) \(NameKey)"
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        for item in indexPaths {
            if let int = item.last {
                self.tmp = String(AppList[int])
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
        return AppList.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "AppItem"), for: indexPath)
        
        item.imageView?.image = NSImage(named: String(AppList[indexPath.item]))
        
        return item
    }
}
