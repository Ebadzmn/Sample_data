import 'package:flutter/material.dart';

class category_widget extends StatelessWidget {
  const category_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          children: [
            ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black26,
            ), child: Text('All Filter',style: TextStyle(color: Colors.white),)),
            SizedBox(width: 12,),
            ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                    color: Colors.grey
                )
            ), child: Text('National Park' ,style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.w500,color: Colors.black),)),
            SizedBox(width: 12,),
            ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                    color: Colors.grey
                )
            ), child: Text('National Park' ,style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.w500,color: Colors.black),)),
            SizedBox(width: 12,),
            ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                    color: Colors.grey
                )
            ), child: Text('National Park' ,style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.w500,color: Colors.black),)),
            SizedBox(width: 12,),
            ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                    color: Colors.grey
                )
            ), child: Text('National Park' ,style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.w500,color: Colors.black),)),
            SizedBox(width: 12,),
            ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                    color: Colors.grey
                )
            ), child: Text('National Park' ,style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.w500,color: Colors.black),)),
            SizedBox(width: 12,),
            ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                    color: Colors.grey
                )
            ), child: Text('National Park' ,style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.w500,color: Colors.black),)),
          ],
        ),
      ),
    );
  }
}