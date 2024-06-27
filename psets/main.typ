#import "@preview/unequivocal-ams:0.1.0": ams-article, theorem, proof

#let abstract = [These are some of my solutions for the problem sets in Linear Algebra Done
  Wrong. They are by no means comprehensive nor definitive, but I have generally
  tried to make sure that they are at least mathematically correct.]

#show: ams-article.with(
  title: [Selected Problems from Linear Algebra Done Wrong, Treil 2017], authors: (
    (
      name: "Youwen Wu", organization: [University of California, Santa Barbara], email: "youwen@ucsb.edu", url: "https://youwen.dev",
    ),
  ), abstract: abstract, bibliography: bibliography("refs.bib"),
)

#set par(first-line-indent: 0em)

= Basic Notions

== Vector Spaces

Problem 1.1.4: Prove that a zero vector $bold(0)$ of a vector space $V$ is
unique.
#proof[
  Suppose that there exists at least two distinct zero vectors, $0_1$ and $0_2$,
  both satisfying Axiom 3:
  $ forall v in V, \
  v + 0_1 = v \
  v + 0_2 = v $
  Then,
  $
    0_1 &= 0_1 + 0_2 \
    0_1 &= 0_2 + 0_1 && "(commutativity)" \
    0_1 &= 0_2       && "(zero vector)"
  $
  But we said $0_1$ and $0_2$ were distinct, or in other words, $0_1 != 0_2$.
  Therefore, by contradiction, there cannot exist more than one zero vector
  satisfying Axiom 3.
]

Problem 1.1.6: Prove that the additive inverse, defined in Axiom 4 of a vector
space is unique.

#proof[
  Suppose there exists at least two distinct additive inverses, $w_1$ and $w_2$,
  both satisfying
  $
    v + w_1 &= 0 \
    v + w_2 &= 0
  $
  This implies
  $
    v + w_1 + w_2 &= 0 + w_1 \
    w_2           &= w_1 && "(by additive inverse and zero vector axioms)"
  $
  But we said that $w_1$ and $w_2$ were distinct ($w_1 != w_2$). Therefore, by
  contradiction, there cannot exist more than one unique additive inverse $w$ such
  that $v + w = 0$
]

#pagebreak()

Problem 1.1.7: Prove that $0 bold(v) = bold(0)$ for any vector $bold(v) in V$.
#proof[
  Note the following:
  $
    0 v = (0 + 0) v = 0 v + 0 v "by axiom 8 and 3"
  $
  The additive inverse of $0 v$ is $-0 v$. Thus:
  $
    0v + 0v - 0v &= 0v - 0v \
    0v           &= 0 && "by axiom 4"
  $
]

Problem 1.1.8: Prove that for any vector $bold(v)$ its additive inverse $bold(-v)$ is
given by $(-1) bold(v)$.
#proof[
  $
    v + (-1)v &= 1 v + (-1) v = v (1 - 1) "using axioms 5 and 7" \
              &= 0v = 0 "as shown in 1.1.7"
  $
  We've shown that $v + (-1) v = 0$. But we also showed in 1.1.6 that the additive
  inverse $-v$, defined as $v + (-v) = 0$, must be unique for a vector space.
  Therefore, $(-1) v$ is the same as the unique additive inverse $-v$, or $-v = (-1) v$.
]

== Linear combinations, bases

2.1. Find a basis in the space of $3 times 2$ matrices $M_(3 times 2)$.

$
  mat(1, 0;0, 0;0, 0)
  mat(0, 1;0, 0;0, 0)
  mat(0, 0;1, 0;0, 0)
  mat(0, 0;0, 1;0, 0)
  mat(0, 0;0, 0;1, 0)
  mat(0, 0;0, 0;0, 1)
$

2.2 True or false:
#set enum(numbering: "a)")
+ #[Any set containing a zero vector is linearly dependent.

    *True*. Given any set ${ v_1, v_2, v_3, ..., 0, ..., v_p }$, we have
    $ 0 v_1 + 0 v_2 + 0 v_3 + ... + alpha_k dot 0 + ... + v_p $
    where $alpha_k in FF$, which shows that the set is linearly dependent, since we
    have infinite non-trivial linear combinations which equal
    $0$. ]

+ #[A basis must contain 0.

    *False*. If a set contains 0, it's linearly dependent, as shown above.
    Therefore, it cannot be a basis. ]

+ #[Subsets of linearly dependent sets are linearly dependent.

    *False*. We showed earlier that any linearly dependent (finite) and complete set
    of vectors also contains a linearly independent subset, namely, the basis. ]

+ #[Subsets of linearly independent sets are linearly independent.

    *True*. We know that no vector in the set can be the linear combination of the
    other vectors of the set. Therefore, any subset of this set also has no vectors
    which are the linear combination of other vectors in the subset. ]

+ #[If $alpha_1 v_1 + alpha_2 v_2 + ... + alpha_n v_n = 0$ then all scalars $alpha_k$ are
    zero;

    *False*. This is only true for linearly independent sets. Linearly dependent
    sets, by definition, have coefficients $a_k$ where $a_k != 0$ and the linear
    combination equals 0. ]

2.3 Recall, that a matrix is called _symmetric_ if $A^T = A$. Write down a basis
in the space of _symmetric_ $2 times 2$ matrices (there are many possible
answers). How many elements are in the basis?

$
  mat(1, 0;0, 0) mat(0, 1;1, 0) mat(0, 0;0, 1)
$

2.4 Write down a basis for the space of

+ #[$3 times 3$ symmetric matrices;

    $
      mat(1, 0, 0;0, 0, 0;0, 0, 0)
      mat(0, 1, 0;1, 0, 0;0, 0, 0)
      mat(0, 0, 1;0, 0, 0;1, 0, 0)
      mat(0, 0, 0;0, 1, 0;0, 0, 0)
      mat(0, 0, 0;0, 0, 1;0, 1, 0)
      mat(0, 0, 0;0, 0, 0;0, 0, 1)
    $
  ]

+ #[$n times n$ symmetric matrices;

  ]

2.5 (Question not reproduced)

It is known that the system is not generating, so not all vectors $v in V$ can
be represented by linear combination of $v_1$ through $v_r$.

Let $v_(r+1) in V$ be one such vector. If it cannot be represented as a linear
combination of $v_1$ through $v_r$, it cannot be represented by
$ sum ^r _(j=1) a_j v_j $
and therefore the system $v_1, v_2, ..., v_r, v_(r+1)$ is still linearly
independent.

#linebreak()
#pagebreak()
*2.6*. Is it possible that vectors $v_1, v_2, v_3$ are linearly dependent, but
the vectors $w_1 = v_1 + v_2$, $w_2 = v_2 + v_3$ and $w_3 = v_3 + v_1$ are
linearly independent?

#linebreak()

*No*. Consider $alpha_1 v_1 + alpha_2 v_2 + alpha_3 v_3 = 0$. Then, there exists
some $alpha_1, alpha_2, alpha_3$
such that

$ |alpha_1| + |alpha_2| + |alpha_3| != 0 $

Now consider
$ beta_1 w_1 + beta_2 w_2 + beta_3 w_3 = 0 $
Substituting in values:
$
  beta_1 (v_1 + v_2) + beta_2 (v_2 + v_3) + beta_3 (v_1 + v_3) = 0 \
  beta_1 v_1 + beta_1 v_2 + beta_2 v_2 + beta_2 v_3 + beta_3 v_1 + beta_3 v_3 = 0 \
  (beta_1 + beta_3) v_1 + (beta_2 + beta_1) v_2 + (beta_2 + beta_3) v_3 = 0
$
For what coefficients is this satisfied? There's the trivial linear combination,
where all coefficients equal 0. However, we have $alpha_1, alpha_2, alpha_3$,
which are coefficients also satisfying this equation, and at least one of which
is non-zero.

We have
$ beta_1 + beta_3 = alpha_1 \
beta_2 + beta_1 = alpha_2 \
beta_2 + beta_3 = alpha_3 $
Eliminating variables, we obtain
$
  beta_3 - beta_2 &= alpha_1 - alpha _2 \
  beta_3          &= (alpha_1 - alpha_2 + alpha_3)/2 \
  beta_1          &= (alpha_1 + alpha_2 - alpha_3)/2 \
  beta_2          &= (3 alpha_2 - alpha_1 - alpha_3)/2
$
Since $alpha_1, alpha_2, alpha_3$ are nonzero, at least one of $beta_1, beta_2, beta_3$ are
also nonzero, therefore $w_1, w_2, w_3$ cannot be linearly independent as there
exists scalars $beta_1, beta_2, beta_3$ such that

$
  beta_1 w_1 + beta_2 w_2 + beta_3 w_3 = 0 \
  |beta_1| + |beta_2| + |beta_3| != 0
$
