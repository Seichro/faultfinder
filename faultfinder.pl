% Created by Anthony Abubakar and Vikranth Chinnam

% Vehicle facts
vehicle(vehicle1).
vehicle(vehicle2).

% Obtained through our own custom website
% VEHICLE 1 FACTS 
% drunkDriving(vehicle1).
% distractedDriving(vehicle1).
% offTrack(vehicle1).
% extremeSpeeding(vehicle1).
% improperTurn(vehicle1).

% VEHICLE 2 FACTS 
% drunkDriving(vehicle2).
% distractedDriving(vehicle2).
% offTrack(vehicle2).
% noTurnSignal(vehicle2).
% improperTurn(vehicle2).

% accident facts

% accidentType(rear_end).
% accidentType(head_on).
% accidentType(side_impact).
% accidentType(side_swipe).
% rearEnd(vehicle1).
headOnCollision(vehicle1).
headOnCollision(vehicle2).

% leverage drunk driving facts to determine if someone is at fault
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, drunkDriving(X), drunkDriving(Y).
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, drunkDriving(X), not drunkDriving(Y).

% leverage distracted driving facts to determine if someone is at fault
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    distractedDriving(X), distractedDriving(Y).
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    distractedDriving(X), not distractedDriving(Y).

% leverage improper turn while driving facts to determine if someone is at fault
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    improperTurn(X), improperTurn(Y).
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    improperTurn(X), not improperTurn(Y).

% determine fault when extreme speeding exists
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    extremeSpeeding(X), extremeSpeeding(Y).
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    extremeSpeeding(X), not extremeSpeeding(Y).

% determine fault when driver is off track (out of their lane)
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    offTrack(X), offTrack(Y).
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    offTrack(X), not offTrack(Y).

% determine fault when speeding exists
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    not offTrack(X), not offTrack(Y),
    speeding(X), speeding(Y).
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    not offTrack(X), not offTrack(Y),
    speeding(X), not speeding(Y).

% determine fault when no turn signal
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    not offTrack(X), not offTrack(Y),
    not speeding(X), not speeding(Y),
    noTurnSignal(X), noTurnSignal(Y).
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    not offTrack(X), not offTrack(Y),
    not speeding(X), not speeding(Y),
    noTurnSignal(X), not noTurnSignal(Y).

% Now we shal do the edge cases:
% When no fault is determined and:
% person is rear-ended, side-impact, or side-swipe, the person who did
% the hitting is at fault. With our convention, vehicle 1 always hits
% vehicle 2
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    not offTrack(X), not offTrack(Y),
    not speeding(X), not speeding(Y),
    not noTurnSignal(X), not noTurnSignal(Y),
    rearEnd(X).

determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    not offTrack(X), not offTrack(Y),
    not speeding(X), not speeding(Y),
    not noTurnSignal(X), not noTurnSignal(Y),
    sideSwipe(X).

determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    not offTrack(X), not offTrack(Y),
    not speeding(X), not speeding(Y),
    not noTurnSignal(X), not noTurnSignal(Y),
    sideImpact(X).

% If in a head-on collision and none are at fault, then both are at fault.
determineFault(X):- vehicle(X), vehicle(Y), X \= Y, not drunkDriving(X), not drunkDriving(Y),
    not distractedDriving(X), not distractedDriving(Y),
    not improperTurn(X), not improperTurn(Y),
    not extremeSpeeding(X), not extremeSpeeding(Y),
    not offTrack(X), not offTrack(Y),
    not speeding(X), not speeding(Y),
    not noTurnSignal(X), not noTurnSignal(Y),
    headOnCollision(X), headOnCollision(Y).
