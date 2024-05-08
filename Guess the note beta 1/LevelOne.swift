//
//  Level 3
//  Level 3
//
//  Created by Mundo Martinez on 4/21/23.
//
import SwiftUI
import AVFoundation
struct LevelOne: View {
    @State var gameStarted = false
    @State var startButtonPressed = false
    @State var chordGuess=""
    @State var wrongChord=0
    @State var rightChord=false
    @State var randnote=""
    @State var showNote = true
    @State var notaVerificada = true
    @State var score = 0
    @State var Hscore3 =  UserDefaults.standard.integer(forKey: "highScore3")
    let notasConSonido: [(String, String)] = [
        ("Do","Do"),
        ("Re","Re"),
        ("Mi","Mi"),
        ("Fa","Fa"),
        ("Sol","Sol"),
        ("La","La"),
        ("Si","Si"),
        ("Do#","Do#"),
        ("Re#","Re#"),
        ("Fa#","Fa#"),
        ("Sol#","Sol#"),
        ("La#","La#"),
        ("Do-2","Do-2"),
        ("Do#-2", "Do#-2"),
        ("Re-2","Re-2"),
        ("Re#-2", "Re#-2"),
        ("Mi-2","Mi-2"),
        ("Fa-2","Fa-2"),
        ("Fa#-2", "Fa#-2"),
        ("Sol-2", "Sol-2"),
        ("Sol#-2", "Sol#-2"),
        ("La-2", "La-2"),
        ("La#-2", "La#-2"),
        ("Si-2", "Si-2"),
        ("Do-4", "Do-4"),
        ("Do#-4", "Do#-4"),
        ("Re-4", "Re-4"),
        ("Re#-4", "Re#-4"),
        ("Mi-4", "Mi-4"),
        ("Fa-4", "Fa-4"),
        ("Fa#-4", "Fa#-4"),
        ("Sol-4", "Sol-4"),
        ("Sol#-4", "Sol#-4"),
        ("La-4", "La-4"),
        ("La#-4", "La#-4"),
        ("Si-4", "Si-4"),
    ]
    var body: some View {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                Circle()
                    .scale(1.5)
                    .foregroundColor(Color.white.opacity(0.15))
                    .position(x: 210, y: 600)
                VStack {
                    Text("\(Hscore3)")
                        .frame(width:80,height:40)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .position(x:350)
                    Text("Level 3")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .position(x: 214, y: -115)
                    Text("\(score)")
                        .font(.title)
                        .bold()
                        .scaleEffect(CGSize(width: 2.0, height: 2.0))
                        .position(x: 210, y: -160)
                    Button("Start"){
                        startButtonPressed=true
                        gameStarted = true
                        generarNotaAleatoria()
                    }
                    .foregroundColor(.white)
                    .frame(width:100,height:50)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(10)
                    .position(x: 207, y: -100)
                    .opacity(startButtonPressed ? 0 : 1)
                    .scaleEffect(startButtonPressed ? 1.2 : 1.0)
                    .animation(.easeOut(duration: 0.2), value: startButtonPressed)
                    
                    Text("The note is")
                        .font(.title)
                        .foregroundColor(.white)
                        .position(x: 205, y:-320)
                    
                    if randnote.hasSuffix("-2"){
                        let notanorms=String(randnote.dropLast(2))
                        Text("\(notanorms)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .scaleEffect(CGSize(width: 3.0, height: 3.0))
                            .foregroundColor(Color.white)
                            .position(x: 205, y:-340)
                            .opacity(showNote ? 0:1)
                    }
                    else if randnote.hasSuffix("-4"){
                        let notaAltnorms=String(randnote.dropLast(2))
                        Text("\(notaAltnorms)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .scaleEffect(CGSize(width: 3.0, height: 3.0))
                            .foregroundColor(Color.white)
                            .position(x: 205, y:-340)
                            .opacity(showNote ? 0:1)
                    }
                    else{
                        Text("\(randnote)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .scaleEffect(CGSize(width: 3.0, height: 3.0))
                            .foregroundColor(Color.white)
                            .position(x: 205, y:-340)
                            .opacity(showNote ? 0:1)
                    }
                    
                    VStack(spacing: 20){
                    
                        Button("⏎"){
                        guard gameStarted else {
                            return
                        }
                        reproducirNota(nota:randnote)
                    }
                    .foregroundColor(.white)
                    .frame(width:100,height:50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .position(x: 240, y: -280)
                    
                    
                    Button("Play"){
                        guard gameStarted, notaVerificada else {
                            return
                        }
                        if showNote || (rightChord==true) {
                        generarNotaAleatoria()
                        reproducirNota(nota:randnote)
                        showNote=true
                        wrongChord = 0
                            notaVerificada = false
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width:100,height:50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .position(x: 130, y: -300)
                        
                        
                        Group{
                        
                        Button("Do"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Do")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 115)
                        .frame(width:50,height:165)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 20, y: 0)
                        
                        
                        Button("Re"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Re")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 115)
                        .frame(width:50,height:165)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 75, y: -20)
                        
                        Button("Mi"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Mi")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 280)
                        .frame(width:50,height:330)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 130, y: -122)
                        
                        
                        Button("Fa"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Fa")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 115)
                        .frame(width:50,height:165)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 185, y: -60)
                        
                        Button("Sol"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Sol")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 115)
                        .frame(width:50,height:165)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 240, y: -80)
                        
                        Button("La"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "La")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 115)
                        .frame(width:50,height:165)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x:295, y: -100)
                        
                        Button("Si"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Si")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 280)
                        .frame(width:50,height:330)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 350, y: -202)
                        }
                        
                        Group{
                        
                        Button("Do#"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Do#")
                            
                        }
                        .foregroundColor(.white)
                        .position(x: 25, y: 105)
                        .frame(width:50, height: 155)
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(10)
                        .position(x: 20, y: -305)
                            
                            Button("Re#"){
                                guard gameStarted, !notaVerificada else{
                                    return
                                }
                                verificarNota(notaguess: "Re#")
                                
                            }
                            .foregroundColor(.white)
                            .position(x: 25, y: 105)
                            .frame(width:50, height: 155)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                            .position(x: 75, y: -325)
                            
                            Button("Fa#"){
                                guard gameStarted, !notaVerificada else{
                                    return
                                }
                                verificarNota(notaguess: "Fa#")
                                
                            }
                            .foregroundColor(.white)
                            .position(x: 25, y: 105)
                            .frame(width:50, height: 155)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                            .position(x: 185, y: -345)
                            
                            Button("Sol#"){
                                guard gameStarted, !notaVerificada else{
                                    return
                                }
                                verificarNota(notaguess: "Sol#")
                                
                            }
                            .foregroundColor(.white)
                            .position(x: 25, y: 105)
                            .frame(width:50, height: 155)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                            .position(x: 240, y: -365)
                            
                            Button("La#"){
                                guard gameStarted, !notaVerificada else{
                                    return
                                }
                                verificarNota(notaguess: "La#")
                                
                            }
                            .foregroundColor(.white)
                            .position(x: 25, y: 105)
                            .frame(width:50, height: 155)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                            .position(x: 295, y: -385)
                            
                        }
                        
                        
                    }
                    .position(x: 200, y: 100)
                    .padding()
                    
                }
                .onAppear {
                           // Carga el valor de highScore desde UserDefaults
                           self.Hscore3 = UserDefaults.standard.integer(forKey: "highScore3")
                       }
                .onDisappear {
                    // Guarda el valor de highScore en UserDefaults
                    UserDefaults.standard.set(self.Hscore3, forKey: "highScore3")
                }
            }
        
        }
    func generarNotaAleatoria() {
        rightChord=false
        guard gameStarted else {
            return
        }
        let notas1 = ["Do", "Re", "Mi", "Fa", "Sol"]
        let notas2 = ["La", "Si", "Do#", "Re#", "Fa#"]
        let notas3 = ["Sol#", "La#", "Do-2", "Do#-2", "Re-2"]
        let notas4 = ["Re#-2", "Mi-2", "Fa-2", "Fa#-2", "Sol-2"]
        let notas5 = ["Sol#-2", "La-2", "La#-2", "Si-2","Do-4"]
        let notas6 = ["Do#-4", "Re-4", "Re#-4", "Mi-4","Fa-4"]
        let notas7 = ["Fa#-4", "Sol-4", "Sol#-4", "La-4"]
        let notas8 = ["La#-4","Si-4"]
        let notas = notas1 + notas2 + notas3 + notas4 + notas5 + notas6 + notas7 + notas8
        let notaSeleccionada = notas.randomElement() ?? ""
        randnote = notaSeleccionada
    }
    func reproducirNota(nota: String) {
        guard gameStarted else {
            return
        }
        guard let url = Bundle.main.url(forResource: nota, withExtension: "wav")else{
            print("Error al reproducir la nota")
            return
        }
        let notaConSonido = notasConSonido.first(where: { $0.0 == nota })
        guard let nombreSonido = notaConSonido?.0 else { return }
        
        _ = Bundle.main.url(forResource:nombreSonido, withExtension: "wav")!
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error al reproducir el sonido: \(error.localizedDescription)")
        }
    }
    
    func playRightScore(){
        let url = Bundle.main.url(forResource:"Score_right", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer!.play()
    }
    
    func playWrongScore(){
        let url = Bundle.main.url(forResource:"Score_wrong", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer!.play()
    }
    
    func verificarNota(notaguess: String){
        guard gameStarted else {
            return
        }
        if randnote.hasSuffix("-2"){
            let notaAlt=addtwo(nota: notaguess)
            if notaAlt==randnote{
                playRightScore()
                rightChord = true
                notaVerificada = true
                showNote=false
                wrongChord = 0
                updateScore()
            }
            else{
                wrongChord = 2
                score = 0
                playWrongScore()
            }
        }
        else if randnote.hasSuffix("-4"){
            let notaAlt=addfour(nota: notaguess)
            if notaAlt==randnote{
                playRightScore()
                rightChord = true
                notaVerificada = true
                showNote=false
                wrongChord = 0
                updateScore()
            }
            else{
                wrongChord = 2
                score = 0
                playWrongScore()
            }
        }
            else if notaguess == randnote{
            playRightScore()
            rightChord = true
            notaVerificada = true
            showNote=false
            wrongChord = 0
            updateScore()
        }
        else{
            wrongChord=2
            score=0
            playWrongScore()
        }
    }
    
    func updateScore() {
           score += 1
        if score>Hscore3{
            Hscore3=score
        }
    }
    
    func addtwo(nota:String)->String{
        return nota + "-2"
    }
    
    func addfour(nota:String)->String{
        return nota + "-4"
    }
        
}
var audioPlayer: AVAudioPlayer?
struct LevelOne_Previews: PreviewProvider {
    static var previews: some View {
        LevelOne()
    }
}

