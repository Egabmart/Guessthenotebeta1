//
//  Level 1
//  Level 1
//
//  Created by Mundo Martinez on 4/21/23.
//
import SwiftUI
import AVFoundation
    
    struct LevelThree: View {
        @State var gameStarted = false
        @State var startButtonPressed = false
        @State var chordGuess=""
        @State var wrongChord=0
        @State var rightChord=false
        @State var randnote=""
        @State var showNote = true
        @State var notaVerificada = true
        @State var score = 0
        @State var Hscore =  UserDefaults.standard.integer(forKey: "highScore1")
        
        let notasConSonido: [(String, String)] = [
            ("Do","Do"),
            ("Re","Re"),
            ("Mi","Mi"),
            ("Fa","Fa"),
            ("Sol","Sol"),
            ("La","La"),
            ("Si","Si")
        ]
        var body: some View {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                Circle()
                    .scale(1.5)
                    .foregroundColor(Color.white.opacity(0.15))
                    .position(x: 210, y: 600)
                VStack {
                    Text("\(Hscore)")
                        .frame(width:80,height:40)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .position(x:350)
                    Text("Level 1")
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
                    .background(Color.red)
                    .cornerRadius(10)
                    .position(x: 207, y: -100)
                    .opacity(startButtonPressed ? 0 : 1)
                    .scaleEffect(startButtonPressed ? 1.2 : 1.0)
                    .animation(.easeOut(duration: 0.2), value: startButtonPressed)
                    
                    Text("The note is")
                        .font(.title)
                        .foregroundColor(.white)
                        .position(x: 205, y:-320)
                    
                    Text("\(randnote)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .scaleEffect(CGSize(width: 3.0, height: 3.0))
                        .foregroundColor(Color.white)
                        .position(x: 205, y:-340)
                        .opacity(showNote ? 0:1)
                    
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
                        .position(x: 240, y: -330)
                        
                        
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
                        .position(x: 130, y: -350)
                        
                        
                        Button("Do"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Do")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 280)
                        .frame(width:50,height:330)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 20, y: -130)
                        
                        Button("Re"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Re")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 280)
                        .frame(width:50,height:330)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 75, y: -150)
                        
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
                        .position(x: 130, y: -170)
                        
                        
                        Button("Fa"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Fa")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 280)
                        .frame(width:50,height:330)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 185, y: -190)
                        
                        Button("Sol"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "Sol")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 280)
                        .frame(width:50,height:330)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x: 240, y: -210)
                        
                        Button("La"){
                            guard gameStarted, !notaVerificada else{
                                return
                            }
                            verificarNota(notaguess: "La")
                            
                        }
                        .foregroundColor(.black)
                        .position(x: 25, y: 280)
                        .frame(width:50,height:330)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                        .border(Color.red,width:CGFloat(wrongChord))
                        .position(x:295, y: -230)
                        
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
                        .position(x: 350, y: -250)
                        
                    }
                    .position(x: 200, y: 100)
                    .padding()
                    
                }
                .onAppear {
                           // Carga el valor de highScore desde UserDefaults
                           self.Hscore = UserDefaults.standard.integer(forKey: "highScore1")
                       }
                .onDisappear {
                    // Guarda el valor de highScore en UserDefaults
                    UserDefaults.standard.set(self.Hscore, forKey: "highScore1")
                }
                
            }
        }
        func generarNotaAleatoria() {
            rightChord=false
            guard gameStarted else {
                return
            }
            let notas = ["Do", "Re", "Mi", "Fa", "Sol", "La", "Si"]
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
            if notaguess == randnote{
                playRightScore()
                wrongChord = 0
                rightChord = true
                showNote=false
                notaVerificada = true
                updateScore()
            }
            else{
                playWrongScore()
                wrongChord = 2
                score = 0
            }
        }
        
        func updateScore() {
            score += 1
            if score>Hscore{
                Hscore=score
            }
        }
    }

struct LevelThree_Previews: PreviewProvider {
    static var previews: some View {
        LevelThree()
    }
}

