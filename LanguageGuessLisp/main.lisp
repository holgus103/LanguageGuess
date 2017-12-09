(defstruct language
	name
	logograms
	left-to-right
	abjad
	cyrulic
	accents
)

(defmacro lang(name logograms ltr abjad cyrulic acc)
	(make-language :name name :logograms logograms :left-to-right ltr :abjad abjad :cyrulic cyrulic :accents acc)
)

(defvar languages)

(setq languages `(
	,(lang "chinese" T NIL NIL NIL NIL)
	,(lang "arabic" NIL T T NIL NIL)
	,(lang "hebrew" NIL T NIL NIL NIL)
	,(lang "russian" NIL NIL NIL T NIL)
	,(lang "french" NIL NIL NIL NIL T)
	,(lang "french" NIL NIL NIL NIL NIL)
	)
)