(deffacts startup (start))

(defrule p1
  ?start <- (start)
  =>
  (printout t crlf crlf "Is your computer experiencing issues that may be related to the motherboard? (yes/no) " crlf "Your answer: ")
  (assert (motherboard_issues (read)))
  (retract ?start))

(defrule rule1
  (motherboard_issues yes)
  =>
  (printout t crlf crlf "Let's diagnose potential motherboard issues. Please answer the following questions:" crlf))

(defrule p2
  (motherboard_issues yes)
  =>
  (printout t crlf "Is the computer not powering on at all? (yes/no) " crlf "Your answer: ")
  (assert (computer_not_powering_on (read))))

(defrule rule2
  (motherboard_issues yes)
  (computer_not_powering_on yes)
  =>
  (printout t crlf "If the computer is not powering on, it could indicate a motherboard issue. Check the power source, power cables, and the power supply unit. If the issue persists, further diagnosis is recommended." crlf crlf)
  (assert (potential_causes "Power source, power cables, power supply unit")))

(defrule rule3
  (motherboard_issues yes)
  (computer_not_powering_on no)
  =>
  (printout t crlf "Let's proceed with additional diagnostics." crlf))

(defrule p3
  (motherboard_issues yes)
  =>
  (printout t crlf "Are there any unusual beeping sounds during startup? (yes/no) " crlf "Your answer: ")
  (assert (unusual_beeping_sounds (read))))

(defrule rule4
  (motherboard_issues yes)
  (unusual_beeping_sounds yes)
  =>
  (printout t crlf "The pattern of beeping sounds during startup can be indicative of motherboard issues. Refer to your motherboard manual or seek professional assistance for further guidance." crlf crlf)
  (assert (potential_causes "Beeping sounds during startup")))

(defrule rule5
  (motherboard_issues yes)
  (unusual_beeping_sounds no)
  =>
  (printout t crlf "Let's continue the diagnosis." crlf))

(defrule p4
  (motherboard_issues yes)
  =>
  (printout t crlf "Is the computer experiencing random crashes or blue screen errors? (yes/no) " crlf "Your answer: ")
  (assert (blue_screen_errors (read))))

(defrule rule6
  (motherboard_issues yes)
  (blue_screen_errors yes)
  =>
  (printout t crlf "Random crashes or blue screen errors may indicate motherboard issues. Review the error messages and consider seeking professional assistance for a detailed diagnosis." crlf crlf)
  (assert (potential_causes "Random crashes, blue screen errors")))

(defrule rule7
  (motherboard_issues yes)
  (blue_screen_errors no)
  =>
  (printout t crlf "Let's proceed with further diagnosis." crlf))

(defrule p5
  (motherboard_issues yes)
  =>
  (printout t crlf "Have you recently made any changes to the hardware components or installed new hardware? (yes/no) " crlf "Your answer: ")
  (assert (hardware_changes (read))))

(defrule rule8
  (motherboard_issues yes)
  (hardware_changes yes)
  =>
  (printout t crlf "Recent hardware changes can sometimes lead to compatibility issues with the motherboard. Review the changes made and ensure compatibility. Seek professional assistance if needed." crlf crlf)
  (assert (potential_causes "Recent hardware changes")))

(defrule rule9
  (motherboard_issues yes)
  (hardware_changes no)
  =>
  (printout t crlf "Let's proceed with further diagnosis." crlf))

(defrule p6
  (motherboard_issues yes)
  =>
  (printout t crlf "Is there any burning smell or visible signs of burnt areas on the motherboard? (yes/no) " crlf "Your answer: ")
  (assert (burning_smell_or_burnt_areas (read))))

(defrule rule10
  (motherboard_issues yes)
  (burning_smell_or_burnt_areas yes)
  =>
  (printout t crlf "A burning smell or visible signs of burnt areas on the motherboard indicate serious issues. Power off the computer immediately and seek professional assistance for inspection and repair." crlf crlf)
  (assert (potential_causes "Burning smell, burnt areas")))

(defrule rule11
  (motherboard_issues yes)
  (burning_smell_or_burnt_areas no)
  =>
  (printout t crlf "Let's proceed with further diagnosis." crlf))

(defrule p7
  (motherboard_issues yes)
  =>
  (printout t crlf "Are there issues with USB ports, audio jacks, or other external connectors on the motherboard? (yes/no) " crlf "Your answer: ")
  (assert (connector_issues (read))))

(defrule rule12
  (motherboard_issues yes)
  (connector_issues yes)
  =>
  (printout t crlf "Issues with external connectors can sometimes be related to the motherboard. Inspect the connectors for damage and check for driver updates. Seek professional assistance if needed." crlf crlf)
  (assert (potential_causes "Connector issues")))

(defrule rule13
  (motherboard_issues yes)
  (connector_issues no)
  =>
  (printout t crlf "Thank you for answering the questions. Based on your responses, it's advisable to consult with a professional technician to conduct a thorough motherboard diagnosis and determine the appropriate course of action." crlf crlf)
  (halt))
