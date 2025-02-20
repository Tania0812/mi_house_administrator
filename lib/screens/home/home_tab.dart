import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/util/date_utils.dart';
import 'package:mi_house_administrator/core/util/responsive.dart';
import 'package:mi_house_administrator/features/auth/auth_provider.dart';
import 'package:mi_house_administrator/features/recepcion/recepcion_provider.dart';
import 'package:mi_house_administrator/features/residents/residents_provider.dart';
import 'package:mi_house_administrator/widgets/appbar/appbar.dart';
import 'package:mi_house_administrator/widgets/charts/chart_card.dart';
import 'package:mi_house_administrator/widgets/charts/chart_pie.dart';
import 'package:provider/provider.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Responsive.homeWidth(context);
    final residentsProv = Provider.of<ResidentsProvider>(context);
    final recepcionProv = Provider.of<RecepcionProvider>(context);

    return ListView(
      children: [
        //TODO: add row with right lateral data
        const CustomAppBar(),
        const PresentationCard(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
              future: residentsProv.fetchResidentsStats(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if ((snapshot.data as Failure?) != null) {
                  return Center(child: Text((snapshot.data! as Failure).message));
                }
                return ChartCard(
                  color: const Color(0xFFE68A8A),
                  title: '# RESIDENTES',
                  statsByMonth: residentsProv.statsByMonth!,
                );
              },
            ),
            FutureBuilder(
              future: recepcionProv.fetchRecepcionStats(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if ((snapshot.data as Failure?) != null) {
                  return Center(child: Text((snapshot.data! as Failure).message));
                }
                return ChartCard(
                  color: const Color(0xFF78C7C2),
                  title: '# RECEPCION',
                  statsByMonth: recepcionProv.statsByMonth!,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 320,
              width: width * 0.49,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey[300]!, spreadRadius: 1)],
              ),
              child: const ChartPie(title: 'Hola'),
              //TODO: add sheduled events and my plans done
            ),
            Container(
              height: 320,
              width: width * 0.49,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey[300]!, spreadRadius: 1)],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PresentationCard extends StatelessWidget {
  const PresentationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Responsive.homeWidth(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: width,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withRed(80),
            Theme.of(context).primaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.asset('assets/images/ilustrations/home_ilustration.png'),
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    CustomDateUtils.getFormattedDate(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 30,
            child: Text(
              '¡Buenos ${CustomDateUtils.getGreeting()}, ${Provider.of<AuthProvider>(context).auth!.nombres.split(" ")[0]}!',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 30,
            child: Text(
              'Administrador(a)',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
