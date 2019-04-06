Extension { #name : #GtkTextView }

{ #category : #'*Mars-Tools' }
GtkTextView >> expressionText: aString [ 
	| codeBuffer |
	
	codeBuffer := GtkTextBuffer newTable: GtkTextTagTable newForCode.
	codeBuffer text: aString.
	(StStyleVisitor new 
		visitExpression: aString)
		do: [ :each | each acceptTextBuffer: codeBuffer ].
	
	self textBuffer: codeBuffer
]

{ #category : #'*Mars-Tools' }
GtkTextView >> methodText: aString class: aClass [ 
	| codeBuffer |
	
	codeBuffer := GtkTextBuffer newTable: GtkTextTagTable newForCode.
	codeBuffer text: aString.
	(StStyleVisitor new 
		contextClass: aClass;
		visitMethod: aString)
		do: [ :each | each acceptTextBuffer: codeBuffer ].
	
	self textBuffer: codeBuffer
]