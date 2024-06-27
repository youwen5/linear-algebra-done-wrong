#import "@preview/unequivocal-ams:0.1.0": ams-article, theorem, proof

#show: ams-article.with(
  title: [Notes on Linear Algebra Done Wrong], authors: (
    (
      name: "Youwen Wu", organization: [University of California, Santa Barbara], email: "youwen@ucsb.edu", url: "https://youwen.dev",
    ),
  ),
)

= Chapter 1

== Vector spaces
- Axioms -- familiar rules of algebra, just applied to vectors
  - Cannot mix vectors + scalars in axioms

== Linear combinations, bases

- A system of vectors $v_1, v_2, ..., v_n in V$ is called a basis for $V$ if any
  vector $v$ admits a _unique_ representation
$ v = sum^p_(k=1) a_k v_k $

- Standard basis in $FF^n$ (where $FF$ is $RR$ or $CC$)
$ e_1 = vec(1, 0, 0, dots.v, 0), e_2 = vec(0, 1, 0, dots.v, 0), e_3 = vec(0, 0, 1, dots.v, 0), ..., e_n = vec(0, 0, 0, dots.v, 1) $

- Standard basis for $PP_n$ (the polynomials of degree at most $n$)
$ e_0 := 1, e_1 := t, e_2 := t^2, e_3 := t^3, ..., e_n := t^n $

- A system of vectors $v_1, v_2, ..., v_p in V$ is a _generating system_ (also _spanning system_ or _complete system_)
  in $V$ if any vector $v in V$ admits representation as a linear combination of $v_1, v_2, ..., v_p$
  - Only difference from def. of basis is that we do not assume the representation
    is _unique_

- A linear combination $alpha_1 v_1 + alpha_2 v_2 + ... + alpha_p v_p$ is called _trivial_ if $a_k = 0 " " forall k$.
  - *Trivial linear combination* is always equal to $0$

- A system of vectors $v_1, v_2, ... v_p in V$ is called _linearly independent_ if
  only the trivial linear combination of $v_1, v_2, ..., v_p$ equals $0$.
  - In other words, the system is linearly independent $<==>$ $x_1 v_1 + x_2 v_2 + ... + x_p v_p = 0$ has
    only the trivial solution $x_1 = x_2 = ... x_p = 0$

- If a system is not linearly independent, it is _linearly dependent_

- A system of vectors $v_1, v_2, ..., v_p$ is called linearly dependent if
there exist scalars $alpha_1, alpha_2, ..., alpha_p$, where
$ sum^p_(k=1) |a_k| != 0 \
"such that" sum^p _(k=1) a_k v_k = 0 $

- Alternatively, a system $v_1, v_2, ..., v_p$ is linearly independent $<==>$ the
  equation
$ x_1 v_1 + x_2 v_2 + ... + x_p v_p = 0 $
has a *non-trivial* solution

- Non-trivial meaning _at least one_ $x_k$ is different from 0, or
$ sum^p _(k=1) |x_k| != 0 $

_Remark._ Another notion of linear independence or dependence (best understood
in a Cartesian plane or 3-D space) is whether or not each vector affords an
additional "dimension" of movement. If each vector allows access to a new
dimension, then the only way to remain at $0$ (the origin) is for each vector to
be scaled by coefficient $0$. Otherwise, if two vectors access the exact same
dimensions, they can be scaled in such a way to negate each other, allowing $0$ to
be represented with non-zero coefficients.

#theorem[ A system of vectors $v_1, v_2, ..., v_p in V$ is linearly dependent $<==>$ one
  of the vectors, $v_k$, can be represented as a linear combination of the other
  vectors
  $ v_k = sum^(p)_(j=1 and j != k) beta_j v_j $ ]<linear-independent-combination>
#proof[
  Suppose that we have a system $v_1, v_2, ..., v_p$ that is linearly dependent.
  Then, for some indices $k$, we must have
  $ sum^p_(k=1) |alpha_k| != 0 $
  Then we can write the system as
  $ alpha_k v_k + sum^p_(j=1 and j!=k) alpha_j v_j = 0 $
  Moving terms around, we have
  $ v_k = sum^p_(j=1 and j!=k) - alpha_j/alpha_k v_j $
  Which is $v_k = sum^(p)_(j=1 and j != k) beta_j v_j$, with $beta_j = - alpha_j/alpha_k$.
]

- Trivially, any basis is a linearly independent system
  - Recall that a basis in $V$ allows any vector $in V$ a unique representation as $sum_(k=1)^p a_k v_k$
  - This implies $0$ is given a unique representation by the basis. Since the
    trivial linear combination always gives zero, regardless of linear
    (in)dependence, the trivial linear combination must also be the _only one_ giving $0$,
    satisfying the definition of linear independence.

Conversely,
#theorem[
  A system of vectors $v_1, v_2, ..., v_n in V$ is a basis $<==>$ it is linearly
  independent and complete.
]
#proof[
  #let aa = $accent(alpha, ~)$
  We seek to show that if a system of vectors is linearly independent and
  complete, then it is a basis. Suppose we have a system $v_1, v_2, v_3, ..., v_p in V$,
  which is linearly independent and complete.

  Consider any vector $v in V$. Since the system is complete, $v$ can be
  represented as a linear combination
  $ v = sum_(k=1) ^p alpha_k v_k $
  This satifies part of the definition of a basis. We need only show that this
  representation is _unique_. Say we have another $aa_k$ such that admits
  representation as a linear combination

  $ v = sum_(k=1) ^p aa_k v_k $

  Then,
  $
    v = sum_(k=1) ^p (alpha_k - aa_k) v_k = sum_(k=1) ^p alpha_k v_k - sum_(k=1) ^p aa_k v_k = v - v = 0 \
  $
  Because it's linearly independent, only the trivial linear combination can equal $0$,
  and
  $ sum ^p _(k=1) |a_k| = 0 $
  So $alpha_k - aa_k = 0 " " forall k$, $a_k = aa_k$ implying that $aa_k$ does not
  admit a separate representation. Thus,
  $ v = sum_(k=1) ^p alpha_k v_k $
  is unique.
]

#theorem[
  Any (finite) generating system contains a basis.
]
#proof[
  Suppose $v_1, v_2, v_3, v_p in V$ is a generating set. If it's also linearly
  independent, then it's a basis and we are done. Otherwise, it's linearly
  dependent, and there is at least one vector $v_k$ which can be represented as a
  linear combination of the other vectors.

  Thus, we can remove $v_k$ from our set, and it remains complete. If the set is
  still linearly dependent, then repeat the process. If we remove all items, then
  we have $emptyset$ and it's not a generating system. Therefore, we can eliminate
  all $v_k$ which can be represented as the linear combination of other vectors $v_j$,
  and we are left with a linearly independent and complete set of vectors, or a
  basis.
]

== Linear Transformations. Matrix-vector multiplication

- _Transformation_ $T: X -> Y$ is a rule that for each $x in X$, $y = T(x) in Y$
  - The _set_ $X$ is called the _domain_ of $T$, and the set $Y$ is called the _target space_ or _codomain_ of $T$.

*Definition.* Let $V, W$ be vector spaces (over the same field $FF$). A
transformation $T : V -> W$ is called linear if
+ $T(u + v) = T(u) + T(v) " " forall u, v in V$
+ $T(alpha v) = alpha T(v) " " forall v in V "and" forall "scalars" alpha in FF$

- #[Linear transformations $T: RR -> RR$ can be given by
    $ T(x) = a x "where" a = T(1) $
    Any linear transformation of $RR$ is just multiplication by a constant ]

- #[A linear transformation $T : FF^n -> FF^m$ can also be represented as
    multiplication, but by matrix, not scalar]

- #[If you want $A x = T(x)$, then you have the _column by coordinate_ rule
    $ A x = sum ^n _(k=1) x_k a_k = x_1 vec(a_(1,1), a_(2, 1), dots.v, a_(m, 1)) + x_2 vec(a_(1,2), a_(2, 2), dots.v, a_(m, 2)) + ... + x_n vec(a_(1,n), a_(2, n), dots.v, a_(m, n)) $
  ]
