//
//  SelectPictureViewController.swift
//  PhotoEditor
//
//  Created by 洪宗燦 on 2024/8/15.
//

import UIKit

class SelectPictureViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var newImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         if let selectedImage = info[.originalImage] as? UIImage {
             
             newImage.image = selectedImage
             // Handle the selected image here
             // You can display it in an image view or perform any other actions.
         }
         picker.dismiss(animated: true, completion: nil)
        
        performSegue(withIdentifier: "ShowPhotoEditor", sender: nil)
     }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondViewController = segue.destination as? EditPictureViewController {
            secondViewController.receivedImage.image = newImage.image
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func selectPictureButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
    }
   
  
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         picker.dismiss(animated: true, completion: nil)
     }
}
