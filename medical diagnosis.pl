% Define symptoms
symptom(fever).
symptom(cough).
symptom(headache).
symptom(runny_nose).
symptom(sore_throat).
symptom(chest_pain).
symptom(fatigue).
symptom(nausea).

% Define some diagnoses
diagnosis(flu) :- */
    symptom(fever),
    symptom(cough),
    symptom(headache),
    symptom(fatigue).

diagnosis(cold) :-
    symptom(runny_nose),
    symptom(sore_throat),
    symptom(cough).

diagnosis(covid19) :- 
    symptom(fever),
    symptom(cough),
    symptom(chest_pain),
    symptom(fatigue),
    symptom(nausea).

diagnosis(heart_attack) :-
    symptom(chest_pain),
    symptom(fatigue).

% Rule to determine possible diagnoses based on symptoms
possible_diagnoses(Diagnosis) :-
    diagnosis(Diagnosis),
    format('Possible diagnosis: ~w~n', [Diagnosis]).

% Example query: 
% ?- symptom(fever), symptom(cough), symptom(headache), symptom(fatigue), possible_diagnoses(Diagnosis).
% Output: Possible diagnosis: flu

% To list all possible diagnoses based on the symptoms you provide, you can use:
% ?- symptom(fever), symptom(cough), symptom(headache), symptom(fatigue), possible_diagnoses(Diagnosis).