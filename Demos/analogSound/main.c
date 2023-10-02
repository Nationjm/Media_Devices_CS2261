/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */

#include "lib.h"
#include "analogSound.h"
#include <stdio.h>

// CHANNEL 3 is still not ready
enum mode {SONG, CHANNEL1, CHANNEL3, DRUM, DEMO, NONE};
enum mode mode = SONG;
enum mode prevMode = NONE;

char* emptyRow = "                                        ";

/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */

NoteWithDuration song[] = {
//C4.. C4.. G4.. G4.. A4. A4. A4. A4. G4.... F4.. F4.. E4..E4.. D4.. D4.. C4....
//G4.. G4. G4. F4.. F4.. E4.. E4. E4. D4.... G4.. G4. G4. F4. F4. F4. F4. E4.. E4. E4. D....
//C4.. C4.. G4.. G4.. A4. A4. A4. A4. G4.... F4.. F4.. E4..E4.. D4.. D4.. C4....
  {NOTE_C4, 125}, // Ba
  {NOTE_C4, 125}, // Ba
  {NOTE_G4, 125}, // Black
  {NOTE_G4, 125}, // Sheep
  {NOTE_A4, 62}, // Have
  {NOTE_A4, 62}, // You
  {NOTE_A4, 62}, // An-
  {NOTE_A4, 62}, // y
  {NOTE_G4, 125}, // Wool
  {REST, 125},
  {NOTE_F4, 125}, // Yes
  {NOTE_F4, 125}, // Sir
  {NOTE_E4, 125}, // Yes
  {NOTE_E4, 125}, // Sir
  {NOTE_D4, 125}, // Three
  {NOTE_D4, 125}, // Bags
  {NOTE_C4, 125}, // Full.
  {REST, 125},
  {NOTE_G4, 125}, // One
  {NOTE_G4, 62}, // For
  {NOTE_G4, 62}, // The
  {NOTE_F4, 125}, // Butch-
  {NOTE_F4, 125}, // er,
  {NOTE_E4, 125}, // One
  {NOTE_E4, 62}, // for
  {NOTE_E4, 62}, // the
  {NOTE_D4, 125}, // Dame
  {REST, 125},
  {NOTE_G4, 125}, // One
  {NOTE_G4, 62}, // for
  {NOTE_G4, 62}, // the
  {NOTE_F4, 62}, // lit-
  {NOTE_F4, 62}, // le
  {NOTE_F4, 62}, // boy
  {NOTE_F4, 62}, // who
  {NOTE_E4, 125}, // live
  {NOTE_E4, 62}, // down
  {NOTE_E4, 62}, // the
  {NOTE_D4, 125}, // lane.
  {REST, 125},
  {NOTE_C4, 125}, // Ba
  {NOTE_C4, 125}, // Ba
  {NOTE_G4, 125}, // Black
  {NOTE_G4, 125}, // Sheep
  {NOTE_A4, 62}, // Have
  {NOTE_A4, 62}, // You
  {NOTE_A4, 62}, // An-
  {NOTE_A4, 62}, // y
  {NOTE_G4, 125}, // Wool
  {REST, 125},
  {NOTE_F4, 125}, // Yes
  {NOTE_F4, 125}, // Sir
  {NOTE_E4, 125}, // Yes
  {NOTE_E4, 125}, // Sir
  {NOTE_D4, 125}, // Three
  {NOTE_D4, 125}, // Bags
  {NOTE_C4, 125}, // Full.
  {REST, 125}
};

/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */

int main(){
  u16 currentNote = 0;
  u32 songLength = sizeof(song) / sizeof(NoteWithDuration);

  REG_DISPCNT = MODE3 | BG2_ENABLE;

  initSound();

  REG_SND3_WAV[0] = 0x5476;
  REG_SND3_WAV[1] = 0x1032;
  REG_SND3_WAV[2] = 0xDCFE;
  REG_SND3_WAV[3] = 0x98BA;
  REG_SND3_WAV[4] = 0x5476;
  REG_SND3_WAV[5] = 0x1032;
  REG_SND3_WAV[6] = 0xdcfe;
  REG_SND3_WAV[7] = 0x98ba;

  u8 songDuty = 2;

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

  u8 c1SweepShift = 0;  // (0-7)
  u8 c1SweepDir = 0;  // 0 Inc; 1 Decr
  u8 c1SweepTime = 0;  // units of 7.8ms (0-7, min=7.8ms, max=54.7ms)
  u8 c1Length = 0;  // 0-63, 0 is longest (250ms), 63 is shortest (1/256th of a second)
  u8 c1Duty = 0;  // 0-3; 12.5%, 25%, 50% (normal), 75%
  u8 c1EnvelopeStepTime = 0;  // Envelope Step-Time; units of n/64s  (1-7, 0=No Envelope)
  u8 c1EnvelopeDir = 0;  // (0=Decrease, 1=Increase)
  u16 c1Freq = 0;  // 131072/(2048-n)Hz  (0-2047)

  u8 drumR = 0;  // Dividing Ratio of Frequencies (r) (0-7)
  u8 drumS = 0;  // Shift Clock Frequency (s) (0-15)
  u8 drumB = 0;  // Counter Step/Width (0=15 bits, 1=7 bits)
  u8 drumLength = 0;  // 0-63, 0 is longest (250ms), 63 is shortest (1/256th of a second)
  u8 drumEnvelopeStepTime = 0;  // Envelope Step-Time; units of n/64s  (1-7, 0=No Envelope)

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

  u32 count = 0;  // for music delay between notes using frame counting
  u32 duration = song[currentNote].duration;
  int playSong = 0;

  u16 tempo = 250;  // higher means slower, so kind of the opposite of bpm

  u16 color = RGB(31, 0, 31);
  u16 bgcolor = RGB(0,0,0);
  char printBuffer[41] = "";

  int effect = 0;

  while(1) {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
      mode = (mode + 1) % NONE;  // cycle through modes
      if (mode == CHANNEL3) mode++; // CHANNEL 3 is not ready yet...
    }
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

    if (mode == DRUM) {
      if (BUTTON_PRESSED(BUTTON_START)) drumEnvelopeStepTime = (drumEnvelopeStepTime + 1) & 7;

      if (BUTTON_PRESSED(BUTTON_R)) drumLength = (drumLength + 1) & 0x3F;
      if (BUTTON_PRESSED(BUTTON_L)) drumLength = (drumLength - 1) & 0x3F;

      if (BUTTON_PRESSED(BUTTON_UP)) drumR = (drumR + 1) & 7;
      if (BUTTON_PRESSED(BUTTON_DOWN)) drumR = (drumR - 1) & 7;

      if (BUTTON_PRESSED(BUTTON_RIGHT)) drumS = (drumS + 1) & 15;
      if (BUTTON_PRESSED(BUTTON_LEFT)) drumS = (drumS - 1) & 15;
      
      if (BUTTON_PRESSED(BUTTON_B)) drumB ^= 1;

      if (BUTTON_PRESSED(BUTTON_A)) {  // play around with drum sounds
        playDrumSound(drumR, drumS, drumB, drumLength, drumEnvelopeStepTime);
      }
    }
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

    if (mode == SONG || mode == DEMO){
      if (BUTTON_PRESSED(BUTTON_LEFT)) songDuty = (songDuty - 1) & 3;
      if (BUTTON_PRESSED(BUTTON_RIGHT)) songDuty = (songDuty + 1) & 3;

      if (BUTTON_PRESSED(BUTTON_START)){
        if (playSong){
          playSong = 0;
          currentNote = 0;
          duration = song[currentNote].duration;
        } else {
          playSong = 1;
        }
      }
      
      if (playSong && count >= duration*tempo/1000) {
        playNoteWithDuration(&song[currentNote], songDuty);
        duration = song[currentNote].duration;
        currentNote = (currentNote + 1) % songLength;
        count = 0;
      }
    }
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

    if (mode == CHANNEL1) {
      if (BUTTON_PRESSED(BUTTON_UP)) c1SweepShift = (c1SweepShift + 1) & 7;
      if (BUTTON_PRESSED(BUTTON_DOWN)) c1SweepTime = (c1SweepTime + 1) & 7;
      if (BUTTON_PRESSED(BUTTON_LEFT)) c1EnvelopeStepTime = (c1EnvelopeStepTime + 1) & 7;
      if (BUTTON_PRESSED(BUTTON_RIGHT)) c1Duty = (c1Duty + 1) & 3;
      if (BUTTON_PRESSED(BUTTON_L)) c1Length = (c1Length - 1) & 0x3F;
      if (BUTTON_PRESSED(BUTTON_R)) c1Length = (c1Length + 1) & 0x3F;

      if (BUTTON_PRESSED(BUTTON_B)) c1SweepDir ^= 1;
      if (BUTTON_PRESSED(BUTTON_START)) c1EnvelopeDir ^= 1;

      if (BUTTON_PRESSED(BUTTON_A)){  // A plays current with sweep.
        if (song[currentNote].note != REST) {
          playChannel1(song[currentNote].note, c1Length, c1SweepShift, c1SweepTime, c1SweepDir, c1EnvelopeStepTime, c1EnvelopeDir, c1Duty);
        }
        currentNote = (currentNote + 1) % songLength;
      }
    }
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

    if (mode == CHANNEL3){
      if (BUTTON_PRESSED(BUTTON_UP)) { // waveform generation
        REG_SND3FREQ = SND_RESET | 0x0563; //restart
        REG_SND3SEL = (1 << 7);  // play
        REG_SND3CNT = 1<<13 | 0xeb; //Force volume
      } else if (BUTTON_PRESSED(BUTTON_DOWN)){
        REG_SND3CNT = 0;
      }
    }

    if (mode == DEMO){
      if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        playAnalogSound(effect);
        effect = (effect + 1) % 18;
      }

      if (BUTTON_PRESSED(BUTTON_A)) {  // drum sound
        playDrumSound(drumR, drumS, drumB, drumLength, drumEnvelopeStepTime);
      }
      if (BUTTON_PRESSED(BUTTON_L)) {  // play c1
        playChannel1(song[currentNote].note, c1Length, c1SweepShift, c1SweepTime, c1SweepDir, c1EnvelopeStepTime, c1EnvelopeDir, c1Duty);
      }
      if (BUTTON_PRESSED(BUTTON_R)) {  // play next note in song
        playNoteWithDuration(&song[currentNote], songDuty);
      }
    }
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

    oldButtons = BUTTONS;
    waitForVBlank();

    if (mode == SONG) {
      if (prevMode != SONG) {
        fillScreen(bgcolor);
        drawString(0, 0, "Song Mode", color);
        drawString(0, 8, "Press Start to Play/Pause Song.", color);
        drawString(0, 16, "D-Pad L/R: Adjust Duty", color);
        drawString(0, 40, "Count: ", color);

        prevMode = SONG;
      }
      sprintf(printBuffer, "Duty: %d", songDuty);
      drawStringWithBGColor(0, 24, printBuffer, color, bgcolor);
      sprintf(printBuffer, "%2d", count);
      drawStringWithBGColor(sizeof("Count: ")*6, 40, printBuffer, color, bgcolor);

      if (playSong) count++;
    }
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

    if (mode == CHANNEL1){
      if (prevMode != CHANNEL1) {
        fillScreen(bgcolor);
        drawString(0, 0, "CHANNEL1 Mode", color);
        drawString(0, 8, "A plays current note.", color);
        drawString(0, 16, "D-pad: Up Incr. SweepShift (SS)", color);
        drawString(0, 24, "D-pad: Down Incr. SweepTime (ST)", color);
        drawString(0, 32, "D-pad: Left Incr. EnvStepTime (EST)", color);
        drawString(0, 40, "D-pad: Right Incr. Duty (D)", color);
        drawString(0, 48, "L/R: Adjust Length (L)", color);
        drawString(0, 56, "B: Toggle Sweep Dir (S_DIR)", color);
        drawString(0, 64, "Start: Toggle Env Dir (E_DIR)", color);
        drawString(0, 80, "C1 Params (SS,ST,EST,D,L,S_DIR,E_DIR):", color);
        drawString(0, 96, "Next Note: ", color);
        prevMode = CHANNEL1;
      }
      sprintf(printBuffer, "%d,%d,%d,%d,%d,%d,%d     ", c1SweepShift, c1SweepTime, c1EnvelopeStepTime, c1Duty, c1Length, c1SweepDir, c1EnvelopeDir);
      drawStringWithBGColor(0, 88, printBuffer, color, bgcolor);
      sprintf(printBuffer, "%d", song[currentNote].note);
      drawStringWithBGColor(6*sizeof("Next Note: "), 96, printBuffer, color, bgcolor);
    }

    if (mode == CHANNEL3){
      if (prevMode != CHANNEL3) {
        fillScreen(bgcolor);
        drawString(0, 0, "CHANNEL3 Mode", color);
        drawString(0, 8, "Up/Down on D-Pad to start/stop waveform sound.", color);
        prevMode = CHANNEL3;
      }
    }
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

    if (mode == DRUM){
      if (prevMode != DRUM) {
        fillScreen(bgcolor);
        drawString(0, 0, "Channel4 (\"Drum\") Mode", color);
        drawString(0, 8, "A plays current drum params.", color);
        drawString(0, 16, "D-pad: Up/Down Adjust R", color);
        drawString(0, 24, "D-pad: Left/Right Adjust S", color);
        drawString(0, 32, "L/R: Adjust Length (L)", color);
        drawString(0, 40, "B: Toggle Bit Mode (B)", color);
        drawString(0, 48, "Start: Inc Envelope (E)", color);
        drawString(0, 74, "Drum Params (R,S,B,L,E): ", color);
        prevMode = DRUM;
      }
      sprintf(printBuffer, "%d,%2d,%d,%2d,%d", drumR, drumS, drumB, drumLength, drumEnvelopeStepTime);
      drawStringWithBGColor(sizeof("Drum Params (R,S,B,L,E): ")*6, 74, printBuffer, color, bgcolor);
    }

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
    if (mode == DEMO){
      if (prevMode != DEMO) {
        fillScreen(bgcolor);
        drawString(0, 0, "DEMO Mode", color);
        drawString(0, 8, "Start: toggle song", color);
        drawString(0, 16, "L/R: Play current C1 / C2", color);
        drawString(0, 24, "A: Play Current C4", color);
        // drawString(0, 32, "B: Toggle C3", color);
        drawString(0, 40, "D-RIGHT: Cycle through sound effects", color);
        prevMode = DEMO;
      }
      if (playSong) count++;
      sprintf(printBuffer, "Next Effect: %2d", effect);
      drawStringWithBGColor(0, 56, printBuffer, color, bgcolor);
    }
    drawStringWithBGColor(0, 150, "Press Select to cycle modes.", color, bgcolor);
  }
}

/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */