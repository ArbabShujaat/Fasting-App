import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
//import 'package:intl/intl.dart' show DateFormat;

class CalenderPage extends StatefulWidget {
  CalenderPage({
    Key key,
  }) : super(key: key);

  @override
  _CalenderPageState createState() => new _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  // DateTime _targetDateTime = DateTime.now();
  //String _currentMonth = DateFormat.yMMM().format(DateTime.now());

  CalendarCarousel _calendarCarouselNoHeader;
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.black,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => null);
      },
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      weekFormat: false,
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 450,
            margin: EdgeInsets.symmetric(horizontal: 08.0),
            child: _calendarCarouselNoHeader,
          ),
        ],
      ),
    );
  }
}
