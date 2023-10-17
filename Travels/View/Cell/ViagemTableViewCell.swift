import UIKit

class ViagemTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundViewCell: UIView!
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var tituloViewLabel: UILabel!
    
    @IBOutlet weak var subtituloViewLabel: UILabel!
    
    @IBOutlet weak var descricaoViewLabel: UILabel!
    
    @IBOutlet weak var tituloValorViewLabel: UILabel!
 
    @IBOutlet weak var valorViewLabel: UILabel!
    
    @IBOutlet weak var valorParcelaViewLabel: UILabel!
    
    @IBOutlet weak var numeroDeParcelasViewLabel: UILabel!
    
    @IBOutlet weak var cancelamentoViewLabel: UILabel!
    
    
    func configuraCelula(_ viagem : Viagem?){
        imageViewCell.image = UIImage(named : viagem?.asset ?? "")
        tituloViewLabel.text = viagem?.titulo ?? ""
        subtituloViewLabel.text = viagem?.subtitulo ?? ""
        valorViewLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        let atributoString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        
        valorParcelaViewLabel.attributedText = atributoString
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Dia" : "Dias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            
            
            descricaoViewLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
        }
        
        DispatchQueue.main.async {
            self.backgroundViewCell.addSombra()
        }
    }
}
