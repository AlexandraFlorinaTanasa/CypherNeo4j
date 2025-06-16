--1) Din client_invoices_discount_payment_invoiceline, calculează valoarea totală pe  fiecare client
--(suma lineTotal din toate invoiceLines),  plus numărul total de plăți pe care le‐a făcut. 

SELECT 
    c.clientID,
    c.firstName,
    c.lastName,
    COALESCE(SUM(il.lineTotal), 0) AS totalSpent,
    COUNT(DISTINCT py.paymentID) AS totalPayments
FROM Client c
JOIN Pet p ON p.clientID = c.clientID
JOIN Appointment a ON a.petID = p.petID
JOIN Invoice i ON i.appointmentID = a.appointmentID
LEFT JOIN InvoiceLine il ON il.invoiceID = i.invoiceID
LEFT JOIN Payment py ON py.invoiceID = i.invoiceID
GROUP BY c.clientID, c.firstName, c.lastName;

--2) Din product_supplier_supplyentry, calculează cât a costat (cantitate * preț unitar)  fiecare aprovizionare
--(supplyEntries), apoi afișează suma totală de achiziție pentru fiecare produs.

SELECT 
    pr.productID,
    pr.name,
    SUM(se.quantity * se.pricePerUnit) AS totalAcquisitionCost
FROM Product pr
JOIN SupplyEntry se ON se.productID = pr.productID
GROUP BY pr.productID, pr.name;


--3) Din treatmentplan_prescribed_administered_home_clinic: află câte administrări (administeredTreatments)  
--s-au făcut în clinic vs. home, pentru fiecare petID

SELECT 
    pt.petID,
    SUM(CASE WHEN at.location = 'clinic' THEN 1 ELSE 0 END) AS clinicCount,
    SUM(CASE WHEN at.location = 'home' THEN 1 ELSE 0 END) AS homeCount
FROM AdministeredTreatment at
JOIN PrescribedTreatment prt ON prt.prescribedTreatmentID = at.prescribedTreatmentID
JOIN TreatmentPlan pt ON pt.planID = prt.planID
GROUP BY pt.petID;

--4) Din appointment_appointmentservice_appointmentservicelink_diagnosis: Obținere totalul feeApplied. 
--Filtrăm după ce totalul depășește 180

SELECT 
    asl.appointmentID,
    SUM(asl.feeApplied) AS totalFee
FROM AppointmentServiceLink asl
GROUP BY asl.appointmentID
HAVING SUM(asl.feeApplied) > 180;


