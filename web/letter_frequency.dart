import 'dart:html';
List lettersList = ['a','à','ä','â','b','c','d','e','é','ë','è','ê','f','g','h','i','ï','î','j','k','l','m','n','o','ö','ô','p','q','r','s','t','u','ù','v','w','x','y','z'];

void main() {
  TextAreaElement textArea = document.query('#text');
  TextAreaElement lettersArea = document.query('#letters');
  ButtonElement lettersButton = document.query('#frequency');
  ButtonElement clearButton = document.query('#clear');

  lettersButton.onClick.listen((MouseEvent e) {
    lettersArea.value = 'letters: frequency \n';
    var text = textArea.value;
    if (text != '') {
      var regexp = new RegExp("[-,;:.?!()'`’“\"\n]");
      var textWhithoutChr = text.replaceAll(regexp, '');
      var chaine =  textWhithoutChr.replaceAll(' ', '');
      var finalText = chaine.toLowerCase();
      var longueurFinalText = finalText.length;
      for (var letter in lettersList) {
        var cmpt = 0;
        if (finalText.indexOf(letter) != -1) {
          for (var lastPosition = 0;lastPosition <= (longueurFinalText - 1);lastPosition++) {
            var newPosition = finalText.indexOf(letter, lastPosition);
            if (newPosition == -1) {
              lettersArea.value = '${lettersArea.value} \n${letter}: ${cmpt}';
              break;
          } else if (newPosition == longueurFinalText - 1) {
              cmpt = cmpt + 1;
              lettersArea.value = '${lettersArea.value} \n${letter}: ${cmpt}';
              break;
          } else {
              cmpt = cmpt +1;
              lastPosition = newPosition;
            }
          }
        }
      }
    } else {
      lettersArea.value = 'Entrez du texte dans le cadran supérieur!';
    }
  });

  clearButton.onClick.listen((MouseEvent e) {
    textArea.value = '';
    lettersArea.value = '';
  });
}
