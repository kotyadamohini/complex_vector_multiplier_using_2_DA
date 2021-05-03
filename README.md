# complex_vector_multiplier_using_2_DA
As we know two complex numbers multiplication takes 4 multipliers.And we can optimize it by using DA and OBC techniques.Now it can also be done incase of vectors.
So,here we took two complex vectors and we found their product in both cases of DA and OBC.we know that
Yre = XreAre-XimAim Imaginary part: Yim = XreAim+XimAre.
If we observe here the same Are(coefficient vector) is used two times which is used in LUT formation.So,here we used Are only once based on the condition that for every K clock cycles the input vector to LUT will change i.e for the first K clock cycle the iput vector is Xre and for another K clock cycles it is Xim.similarly incase of Aim.So here we are using two LUT blocks(Are,Aim) parallelly.For the first K clock Cycles we get Yre i.e real part.In the next K clock cycles we get imaginary part i.e Yim.
In this design we reduced number of LUTs used i.e area with decreasing speed of K clock cycles compare to Using 4 LUTs parallelly.In this project we used DA technique. 
