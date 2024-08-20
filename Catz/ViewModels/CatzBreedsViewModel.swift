//
//  CatzBreeds.swift
//  Catz
//
//  Created by Bruno Madeira on 19/08/2024.
//

import Foundation
import Combine


class CatzBreedsViewModel: ObservableObject {
    
    @Published var breeds: [CatBreed] = []
    @Published var filteredBreeds: [CatBreed] = []
    
    var selectedFramework: CatBreed? {
        didSet { isShowingDetailView = true }
    }
    @Published var isShowingDetailView = false
    
    let url =  "https://api.thecatapi.com/v1/breeds"
    
    private var cancellables = Set<AnyCancellable>()
    
    private var imageCache = [String: String]()
    @Published var isLoading: Bool = false
    
//    init() {
//        fetchBreeds()
//    }
    
    func fetchBreeds() {
        guard !isLoading else { return }
        isLoading = true
        
        NetworkingManager.shared.responseCall(url: url, responseType: [CatBreedDTO].self) { [weak self] result, error in
            
            guard let self = self else { return }
            
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
                return
            }
            if let result = result {
                let limitedBreeds = result.prefix(20)
                var breedsWithImage: [CatBreed] = []
                
                let group = DispatchGroup()
                
                for breedDTO in limitedBreeds {
                    // Usa o cache se a imagem já foi carregada
                    if let cachedImageURL = self.imageCache[breedDTO.id] {
                        let breed = breedDTO.toCatBreed()
                        breed.imageURL = cachedImageURL
                        breedsWithImage.append(breed)
                    } else {
                        group.enter()
                        self.fetchImage(for: breedDTO.id) { imageURL, error in
                            let breed = breedDTO.toCatBreed()
                            if let imageURL = imageURL {
                                self.imageCache[breedDTO.id] = imageURL
                                breed.imageURL = imageURL
                            }
                            breedsWithImage.append(breed)
                            group.leave()
                        }
                    }
                }
                
                group.notify(queue: .main) {
                    self.breeds = breedsWithImage
                    self.filteredBreeds = self.breeds
                    self.isLoading = false
                }
                
                print("**** DEBUG ****\n response is: \n \(result)")
            }
        }
    }
    
    func fetchImage(for breedID: String, completion: @escaping (String?, Error?) -> Void) {
            let url = "https://api.thecatapi.com/v1/images/search?breed_ids=\(breedID)"

        NetworkingManager.shared.responseCall(url: url, responseType: [CatImageSearchDTO].self) { result, error in
                if let imageInfo = result?.first {
                    completion(imageInfo.url, nil)
                } else {
                    completion(nil, error)
                }
            }
        }
    
    func searchBreeds(with query: String) {
            if query.isEmpty {
                filteredBreeds = breeds
            } else {
                filteredBreeds = breeds.filter { $0.name.lowercased().contains(query.lowercased()) }
            }
        }
}
