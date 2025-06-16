1) Din client_invoices_discount_payment_invoiceline, calculează valoarea totală pe  fiecare client (suma lineTotal din toate invoiceLines),  plus numărul total de plăți pe care le‐a făcut. 

MATCH (c:Client)-[:OWNS]->(:Pet)-[:FOR_PET]-(a:Appointment)<-[:FOR_APPOINTMENT]-(i:Invoice)
OPTIONAL MATCH (i)<-[:PART_OF]-(il:InvoiceLine)
OPTIONAL MATCH (i)<-[:PAYS_FOR]-(p:Payment)
WITH c, SUM(il.quantity * il.unitPrice) AS totalLineValue, COUNT(p) AS totalPayments
RETURN c.firstName + ' ' + c.lastName AS client, totalLineValue, totalPayments
ORDER BY totalLineValue DESC



 2) Din product_supplier_supplyentry, calculează cât a costat (cantitate * preț unitar)  fiecare aprovizionare (supplyEntries), apoi afișează suma totală de achiziție pentru fiecare produs.

MATCH (se:SupplyEntry)-[:FOR_PRODUCT]->(p:Product)
WITH p.name AS productName, se.quantity * se.pricePerUnit AS entryCost
RETURN productName, SUM(entryCost) AS totalAcquisitionCost
ORDER BY totalAcquisitionCost DESC

3) Din treatmentplan_prescribed_administered_home_clinic: află câte administrări (administeredTreatments)  s-au făcut în clinic vs. home, pentru fiecare petID

// Începem cu toate animalele
MATCH (p:Pet)

// Numărăm administrările în clinică
OPTIONAL MATCH (p)<-[:FOR_APPOINTMENT]-(a1:Appointment)<-[:FOR_APPOINTMENT]-(pt1:PrescribedTreatment)
                 <-[:ADMINISTERS]-(at1:AdministeredTreatment)<-[:PERFORMED_AT]-(:TreatmentClinic)
WITH p, COUNT(DISTINCT at1) AS clinicCount

// Numărăm administrările acasă
OPTIONAL MATCH (p)<-[:FOR_APPOINTMENT]-(a2:Appointment)<-[:FOR_APPOINTMENT]-(pt2:PrescribedTreatment)
                 <-[:ADMINISTERS]-(at2:AdministeredTreatment)<-[:PERFORMED_AT_HOME]-(:HomeTreatment)
WITH p.id AS petID, clinicCount, COUNT(DISTINCT at2) AS homeCount

RETURN petID, clinicCount, homeCount
ORDER BY petID



4) Din appointment_appointmentservice_appointmentservicelink_diagnosis: Obținere totalul feeApplied. 
Filtrăm după ce totalul depășește 180


MATCH (a:Appointment)<-[:LINKED_TO_APPOINTMENT]-(asl:AppointmentServiceLink)-[:PROVIDES_SERVICE]->(s:AppointmentService)
WITH a.id AS appointmentID, COLLECT(s.name) AS services, SUM(asl.feeApplied) AS totalFee
WHERE totalFee > 180
RETURN appointmentID, services, totalFee
ORDER BY totalFee DESC
