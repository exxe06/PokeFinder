//
//  PokeViewController.swift
//  PokeFinder
//
//  Created by exxe on 12/10/2017.
//  Copyright © 2017 exxe. All rights reserved.
//

import UIKit
import MapKit

class PokeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, MKMapViewDelegate, CLLocationManagerDelegate {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
        
    }
    @IBAction func backBtnPres(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
 
    // New Line
    
    let reuseIdentifier = "cell"
    var poke = pokemon
    
    // Mark: UICollectionViewDataSource protocol
    
    //tell the collection view how many cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.poke.count
    }
    
    //make a cell of each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        //get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PokeCell
        cell.layer.borderWidth = 0.5
        
        // use the outlet in our custom class to get a reference to the UILabel in the Cell
        cell.PokeNameLbl.text = "\(poke[indexPath.item].capitalized)"
        cell.PokeImg.image = UIImage(named: "\(indexPath.item + 1)")
        
        
        //Blureffect
        //        let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
        //        let blurView = UIVisualEffectView(effect: blur)
        //
        //        cell.backgroundView = blurView
        //        cell.backgroundView?.layer.cornerRadius = 5
        
        
        return cell
    }
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("you selected cell #\(indexPath.item)!")
        let pokeId = indexPath.item
        performSegue(withIdentifier: "ViewController", sender: pokeId)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            if let poke = sender as? Int {
                destination.pokeId = poke
            }
        }
    }
}
